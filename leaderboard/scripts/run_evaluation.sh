#!/bin/bash
export CARLA_ROOT=/home/xiangmin/carla
export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:leaderboard
export PYTHONPATH=$PYTHONPATH:leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:scenario_runner

export LEADERBOARD_ROOT=leaderboard
export CHALLENGE_TRACK_CODENAME=SENSORS
export PORT=2000
export TM_PORT=8000
export DEBUG_CHALLENGE=0
export REPETITIONS=1 # multiple evaluation runs
export RESUME=False


# TCP evaluation
export ROUTES=leaderboard/data/evaluation_routes/routes_lav_valid_1_route.xml
export TEAM_AGENT=team_code/tcp_agent.py
export TEAM_CONFIG=/home/xiangmin/verification/saved_vae_models/new.ckpt
export CHECKPOINT_ENDPOINT=results_TCP.json
export SCENARIOS=leaderboard/data/scenarios/all_towns_traffic_scenarios.json
#export SAVE_PATH=data/results_TCP/

# VAE_TCP
export PATH_VAE_MODEL=/home/xiangmin/verification/saved_vae_models/SVAEtcp_soft_intro_betas_1.0_1024.0_1.0_model_epoch_11_iter_147444.pth
# Gym
export FIFO_PATH=/home/xiangmin/verification/pipe

python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
--scenarios=${SCENARIOS}  \
--routes=${ROUTES} \
--repetitions=${REPETITIONS} \
--track=${CHALLENGE_TRACK_CODENAME} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--debug=${DEBUG_CHALLENGE} \
--record=${RECORD_PATH} \
--resume=${RESUME} \
--port=${PORT} \
--trafficManagerPort=${TM_PORT}


