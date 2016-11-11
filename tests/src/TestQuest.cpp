#include <gmock/gmock.h>
#include "state/quest.h"
#include "math_debug_util.h"

#define NUM_ITERATIONS 1000

TEST(TestQuest, TestIdentity) {
    const float observations[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    const float references[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    const float a[2] = {0.5f, 0.5f};


    float q_out[4];

    quest_estimate(observations, references, a, q_out);

    expect_fuzzy_eq(q_out[0], 0);
    expect_fuzzy_eq(q_out[1], 0);
    expect_fuzzy_eq(q_out[2], 0);
    expect_fuzzy_eq(q_out[3], 1);
}

TEST(TestQuest, TestIdentity2) {
    float observations[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    float references[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    Eigen::Quaternionf rotation(Eigen::AngleAxisf(0.5f, Eigen::Vector3f::UnitZ()));

    for (int i = 0; i < 2; i++) {
        Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        observations[i][0] = new_vec[0];
        observations[i][1] = new_vec[1];
        observations[i][2] = new_vec[2];
    }

    for (int i = 0; i < 2; i++) {
        Eigen::Vector3f orig(references[i][0], references[i][1], references[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        references[i][0] = new_vec[0];
        references[i][1] = new_vec[1];
        references[i][2] = new_vec[2];
    }

    const float a[2] = {0.5f, 0.5f};

    float q_out[4];

    quest_estimate(observations, references, a, q_out);

    expect_fuzzy_eq(q_out[0], 0);
    expect_fuzzy_eq(q_out[1], 0);
    expect_fuzzy_eq(q_out[2], 0);
    expect_fuzzy_eq(q_out[3], 1);
}

TEST(TestQuest, TestIdentity3) {
    float observations[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    float references[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    Eigen::Quaternionf rotation(Eigen::AngleAxisf(get_rand(), Eigen::Vector3f::UnitZ()));

    for (int i = 0; i < 1; i++) {
        Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        observations[i][0] = new_vec[0];
        observations[i][1] = new_vec[1];
        observations[i][2] = new_vec[2];
    }

    for (int i = 0; i < 1; i++) {
        Eigen::Vector3f orig(references[i][0], references[i][1], references[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        references[i][0] = new_vec[0];
        references[i][1] = new_vec[1];
        references[i][2] = new_vec[2];
    }

    const float a[2] = {0.5f, 0.5f};

    float q_out[4];

    quest_estimate(observations, references, a, q_out);

    expect_fuzzy_eq(q_out[0], 0);
    expect_fuzzy_eq(q_out[1], 0);
    expect_fuzzy_eq(q_out[2], 0);
    expect_fuzzy_eq(q_out[3], 1);
}

TEST(TestQuest, TestRotation) {
    float observations[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    float references[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    Eigen::Quaternionf rotation(Eigen::AngleAxisf(0.3f, Eigen::Vector3f::UnitZ()));

    for (int i = 0; i < 2; i++) {
        Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        observations[i][0] = new_vec[0];
        observations[i][1] = new_vec[1];
        observations[i][2] = new_vec[2];
    }

    const float a[2] = {0.5f, 0.5f};

    float q_out[4];

    quest_estimate(observations, references, a, q_out);

    // QUEST returns the quaternion to rotate the observations onto the references
    // This should be the reverse of the rotation above
    auto inv_rotation = rotation.inverse();


    expect_quat_eq(inv_rotation, q_out);
}

TEST(TestQuest, TestRotation2) {
    float observations[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    float references[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    Eigen::Quaternionf rotation(Eigen::AngleAxisf(3.14159265359f, Eigen::Vector3f::UnitZ()));

    for (int i = 0; i < 2; i++) {
        Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        observations[i][0] = new_vec[0];
        observations[i][1] = new_vec[1];
        observations[i][2] = new_vec[2];
    }

    const float a[2] = {0.5f, 0.5f};

    float q_out[4];

    quest_estimate(observations, references, a, q_out);

    // QUEST returns the quaternion to rotate the observations onto the references
    // This should be the reverse of the rotation above
    auto inv_rotation = rotation.inverse();

    expect_quat_eq(inv_rotation, q_out);
}

TEST(TestQuest, TestRotation3) {
    float observations[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    float references[2][3] = {
            {1.0, 0.0, 0.0f},
            {0.0, 1.0, 0.0f}
    };

    Eigen::Quaternionf rotation(Eigen::AngleAxisf(1.2f, Eigen::Vector3f::UnitY()));

    for (int i = 0; i < 2; i++) {
        Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
        Eigen::Vector3f new_vec = rotation * orig;
        observations[i][0] = new_vec[0];
        observations[i][1] = new_vec[1];
        observations[i][2] = new_vec[2];
    }

    const float a[2] = {0.5f, 0.5f};

    float q_out[4];

    quest_estimate(observations, references, a, q_out);

    // QUEST returns the quaternion to rotate the observations onto the references
    // This should be the reverse of the rotation above
    auto inv_rotation = rotation.inverse();

    expect_quat_eq(inv_rotation, q_out);
}

TEST(TestQuest, TestRotation4) {
    for (int iter_i = 0; iter_i < NUM_ITERATIONS; iter_i++) {
        float observations[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        float references[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        Eigen::Quaternionf rotation(Eigen::AngleAxisf(3.14159265359f, Eigen::Vector3f::UnitZ()) * Eigen::AngleAxisf(get_rand(0.1f), Eigen::Vector3f::UnitY()) * Eigen::AngleAxisf(get_rand(0.1f), Eigen::Vector3f::UnitX()));

        for (int i = 0; i < 2; i++) {
            Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
            Eigen::Vector3f new_vec = rotation * orig;
            observations[i][0] = new_vec[0];
            observations[i][1] = new_vec[1];
            observations[i][2] = new_vec[2];
        }

        const float a[2] = {0.5f, 0.5f};

        float q_out[4];

        quest_estimate(observations, references, a, q_out);

        // QUEST returns the quaternion to rotate the observations onto the references
        // This should be the reverse of the rotation above
        auto inv_rotation = rotation.inverse();

        expect_quat_eq(inv_rotation, q_out);
    }
}

TEST(TestQuest, TestRotation5) {
    for (int iter_i = 0; iter_i < NUM_ITERATIONS; iter_i++) {
        float observations[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        float references[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        Eigen::Quaternionf rotation(Eigen::AngleAxisf(3.14159265359f, Eigen::Vector3f::UnitY()) * Eigen::AngleAxisf(get_rand(0.1f), Eigen::Vector3f::UnitX()) * Eigen::AngleAxisf(get_rand(0.1f), Eigen::Vector3f::UnitZ()));

        for (int i = 0; i < 2; i++) {
            Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
            Eigen::Vector3f new_vec = rotation * orig;
            observations[i][0] = new_vec[0];
            observations[i][1] = new_vec[1];
            observations[i][2] = new_vec[2];
        }

        const float a[2] = {0.5f, 0.5f};

        float q_out[4];

        quest_estimate(observations, references, a, q_out);

        // QUEST returns the quaternion to rotate the observations onto the references
        // This should be the reverse of the rotation above
        auto inv_rotation = rotation.inverse();

        expect_quat_eq(inv_rotation, q_out);
    }
}

TEST(TestQuest, TestRotation6) {
    for (int iter_i = 0; iter_i < NUM_ITERATIONS; iter_i++) {
        float observations[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        float references[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        Eigen::Quaternionf rotation(Eigen::AngleAxisf(3.14159265359f, Eigen::Vector3f::UnitX()) * Eigen::AngleAxisf(get_rand(0.1f), Eigen::Vector3f::UnitY()) * Eigen::AngleAxisf(get_rand(0.1f), Eigen::Vector3f::UnitZ()));

        for (int i = 0; i < 2; i++) {
            Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
            Eigen::Vector3f new_vec = rotation * orig;
            observations[i][0] = new_vec[0];
            observations[i][1] = new_vec[1];
            observations[i][2] = new_vec[2];
        }

        const float a[2] = {0.5f, 0.5f};

        float q_out[4];

        quest_estimate(observations, references, a, q_out);

        // QUEST returns the quaternion to rotate the observations onto the references
        // This should be the reverse of the rotation above
        auto inv_rotation = rotation.inverse();

        expect_quat_eq(inv_rotation, q_out);
    }
}

TEST(TestQuest, TestRotationRandom) {
    for (int rand_i = 0; rand_i < NUM_ITERATIONS; rand_i++) {
        float observations[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        float references[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        Eigen::Quaternionf rotation(Eigen::AngleAxisf(get_rand(), Eigen::Vector3f::UnitZ()));

        for (int i = 0; i < 2; i++) {
            Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
            Eigen::Vector3f new_vec = rotation * orig;
            observations[i][0] = new_vec[0];
            observations[i][1] = new_vec[1];
            observations[i][2] = new_vec[2];
        }

        const float a[2] = {0.5f, 0.5f};

        float q_out[4];

        quest_estimate(observations, references, a, q_out);

        // QUEST returns the quaternion to rotate the observations onto the references
        // This should be the reverse of the rotation above
        auto inv_rotation = rotation.inverse();

        expect_quat_eq(inv_rotation, q_out);
    }
}

TEST(TestQuest, TestRotationRandom2) {
    for (int rand_i = 0; rand_i < NUM_ITERATIONS; rand_i++) {
        float observations[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        float references[2][3] = {
                {1.0, 0.0, 0.0f},
                {0.0, 1.0, 0.0f}
        };

        Eigen::Quaternionf rotation(Eigen::AngleAxisf(get_rand(), Eigen::Vector3f::UnitZ()) * Eigen::AngleAxisf(get_rand(), Eigen::Vector3f::UnitY()) * Eigen::AngleAxisf(get_rand(), Eigen::Vector3f::UnitX()));

        for (int i = 0; i < 2; i++) {
            Eigen::Vector3f orig(observations[i][0], observations[i][1], observations[i][2]);
            Eigen::Vector3f new_vec = rotation * orig;
            observations[i][0] = new_vec[0];
            observations[i][1] = new_vec[1];
            observations[i][2] = new_vec[2];
        }

        const float a[2] = {0.5f, 0.5f};

        float q_out[4];

        quest_estimate(observations, references, a, q_out);

        // QUEST returns the quaternion to rotate the observations onto the references
        // This should be the reverse of the rotation above
        auto inv_rotation = rotation.inverse();

        expect_quat_eq(inv_rotation, q_out);
    }
}