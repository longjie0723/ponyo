import launch
import launch_ros.actions
from launch.actions import IncludeLaunchDescription
from launch_xml.launch_description_sources import XMLLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():

    dynamixel_node = launch_ros.actions.Node(
        package='dynamixel_sdk_examples', executable='read_write_node', output='screen')
    rosbridge_launch = IncludeLaunchDescription(
         XMLLaunchDescriptionSource([
                    get_package_share_directory("rosbridge_server"), '/launch', '/rosbridge_websocket_launch.xml'])
    )
    return launch.LaunchDescription([
        dynamixel_node,
        rosbridge_launch
    ])