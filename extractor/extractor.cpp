#include "avionics_config.h"
#include <messaging.h>
#include "telemetry_packets.h"
#include <fstream>
#include <atomic>
#include <iostream>
#include <cstring>
#include <can_telemetry.h>
#include <usb_telemetry.h>
#include <thread>
#include <messaging_all.h>
#include <file_telemetry.h>
#include <zconf.h>
#include <cpp_utils.h>


void update_handler(avionics_component_t component, avionics_component_state_t state, int line) {
    if (state == state_error)
        printf("Error in component %i with line %i\n", component, line);
}

avionics_config_t local_config = {telemetry_origin_avionics_gui, update_handler, nullptr, nullptr, true};

const char* output_file_name;
std::ostream* out_stream;
std::atomic<bool> running(true);
std::atomic<bool> input_running(true);

static bool mpu_consumer_func(const telemetry_t* packet, message_metadata_t metadata) {
    if (packet->header.id == telemetry_id_mpu9250_data) {
        mpu9250_data_t* data = (mpu9250_data_t*)packet->payload;
        *out_stream << "MPU9250Data,";

        *out_stream << data->accel[0] << ',';
        *out_stream << data->accel[1] << ',';
        *out_stream << data->accel[2] << ',';

        *out_stream << data->gyro[0] << ',';
        *out_stream << data->gyro[1] << ',';
        *out_stream << data->gyro[2] << ',';

        *out_stream << data->magno[0] << ',';
        *out_stream << data->magno[1] << ',';
        *out_stream << data->magno[2] << std::endl;
    }
    return true;
}


MESSAGING_CONSUMER(mpu_consumer, telemetry_source_mpu9250, telemetry_source_mpu9250_mask, 0, 0, mpu_consumer_func, 1024);

int rocket_main() {
    messaging_all_start();
    messaging_consumer_init(&mpu_consumer);

    std::unique_ptr<std::ofstream> ofstream;
    if (output_file_name == nullptr) {
        out_stream = &std::cout;
    } else {
        ofstream = std::make_unique<std::ofstream>(output_file_name);
        out_stream = ofstream.get();
    }



    bool connected = false;

    if (can_telemetry_connected()) {
        std::cerr << "Using CAN Telemetry\n";
        connected = true;
    }


    if (usb_telemetry_connected()) {
        std::cerr << "Using USB Telemetry\n";
        connected = true;
    }


    if (file_telemetry_input_connected()) {
        if (connected) {
            // They will be interleaved together strangely
            std::cerr << "File telemetry cannot be used at the same time as other telemetry sources - aborting\n";
            return 1;
        }
        std::cerr << "Using File Input Telemetry\n";
        connected = true;
    }

    if (!connected) {
        std::cerr << "No valid data source found\n";
        return 1;
    }

    if (output_file_name == nullptr)
        std::cerr << "Writing data to stdout\n";
    else
        std::cerr << "Writing data to " << output_file_name << std::endl;

    while(running) {
        messaging_consumer_receive(&mpu_consumer, true, false);
    }

    out_stream = nullptr;

    return 0;
}

int wait_for_input(int seconds) {
    struct timeval tv;
    fd_set fds;
    tv.tv_sec = seconds;
    tv.tv_usec = 0;
    FD_ZERO(&fds);
    FD_SET(STDIN_FILENO, &fds);
    select(STDIN_FILENO+1, &fds, NULL, NULL, &tv);
    return FD_ISSET(STDIN_FILENO, &fds);
}


void input_main() {
    while (input_running) {
        if (wait_for_input(1) != 0) {
            std::string str;
            std::cin >> str;
            if (str == "quit")
                break;
        }
        if (!usb_telemetry_connected() && !can_telemetry_connected() && !file_telemetry_input_connected())
            break;
    }

    running = false;
    messaging_consumer_terminate(&mpu_consumer);
}

int main(int argc, char* argv[]) {
    if (argc == 2) {
        local_config.input_file_name = argv[1];
        output_file_name = nullptr;

    } else if (argc == 3) {
        local_config.input_file_name = argv[1];
        output_file_name = argv[2];
    }

    std::thread input_thread(input_main);


    int ret = rocket_main();

    input_running = false;

    input_thread.join();

    return ret;
}
