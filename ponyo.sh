#!/bin/bash

#変数の設定
SCRIPTDIR=/home/admin/Codes/ponyo_ws/src/ponyo
LOGDIR=/home/admin/.ros/log
ENVFILE=/home/admin/Codes/ponyo_ws/install/setup.bash

#実行
if [ -f ${ENVFILE} ]; then
    #環境変数読み込み
    echo "Loading ROS2 Env..."
    source /opt/ros/humble/setup.bash
    source ${ENVFILE}
    if [ -d ${LOGDIR} ]; then
        echo "ROS2 Launching..."
        #export ROS_ALLOWED_HOSTS="localhost.local:robot_1.local"
        #roslaunch実行
        exec ros2 launch ponyo bringup.launch.py >> ${LOGDIR}/ponyo.log 2>&1

        echo "Done."
    else
        echo "There is no ${LOGDIR}"
    fi
else
    echo "There is no ${ENVFILE}"
fi
