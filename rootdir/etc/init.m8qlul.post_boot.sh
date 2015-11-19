#
#
# Copyright (C) 2015 The CyanogenMod Project
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Stripped version of init.qcom.post_boot.sh
# m8qlul target is msm8939
# m8qlul soc_id is 239

echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled
echo 10 > /sys/class/net/rmnet0/queues/rx-0/rps_cpus
echo 2 > /proc/sys/kernel/sched_window_stats_policy

# HMP Task packing settings for 8939
echo 20 > /proc/sys/kernel/sched_small_task
echo 30 > /proc/sys/kernel/sched_mostly_idle_load
echo 3 > /proc/sys/kernel/sched_mostly_idle_nr_run

for devfreq_gov in /sys/class/devfreq/qcom,cpubw*/governor
do
	echo "bw_hwmon" > $devfreq_gov
done

for gpu_bimc_io_percent in /sys/class/devfreq/qcom,gpubw*/bw_hwmon/io_percent
do
	echo 40 > $gpu_bimc_io_percent
done

# disable thermal core_control to update interactive gov settings
echo 0 > /sys/module/msm_thermal/core_control/enabled

# enable governor for perf cluster
echo 1 > /sys/devices/system/cpu/cpu0/online
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "20000 1113600:50000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 85 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 1113600 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo "1 960000:85 1113600:90 1344000:80" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

# enable governor for power cluster
echo 1 > /sys/devices/system/cpu/cpu4/online
echo "interactive" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "25000 800000:50000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 1113600 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
echo "1 800000:90" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor
echo 800000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq

# enable thermal core_control now
echo 1 > /sys/module/msm_thermal/core_control/enabled

# Bring up all cores online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online
echo 1 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu7/online

# HMP scheduler (big.Little cluster related) settings
echo 80 > /proc/sys/kernel/sched_upmigrate
echo 60 > /proc/sys/kernel/sched_downmigrate

#fine tune memory config
setprop  sys.sysctl.extra_free_kbytes 72900
echo "0,2,3,7,9,15" > /sys/module/lowmemorykiller/parameters/adj
echo "27648,41472,48384,72378,84375,121875" > /sys/module/lowmemorykiller/parameters/minfree

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts

setprop ro.min_freq_0 960000
setprop ro.min_freq_4 800000

# Let kernel know our image version/variant/crm_version
image_version="10:"
image_version+=`getprop ro.build.id`
image_version+=":"
image_version+=`getprop ro.build.version.incremental`
image_variant=`getprop ro.product.name`
image_variant+="-"
image_variant+=`getprop ro.build.type`
oem_version=`getprop ro.build.version.codename`
echo 10 > /sys/devices/soc0/select_image
echo $image_version > /sys/devices/soc0/image_version
echo $image_variant > /sys/devices/soc0/image_variant
echo $oem_version > /sys/devices/soc0/image_crm_version

# Create native cgroup and move all tasks to it. Allot 15% real-time
# bandwidth limit to native cgroup (which is what remains after
# Android uses up 80% real-time bandwidth limit). root cgroup should
# become empty after all tasks are moved to native cgroup.

CGROUP_ROOT=/dev/cpuctl
mkdir $CGROUP_ROOT/native
echo 150000 > $CGROUP_ROOT/native/cpu.rt_runtime_us

# We could be racing with task creation, as a result of which its possible that
# we may fail to move all tasks from root cgroup to native cgroup in one shot.
# Retry few times before giving up.

for loop_count in 1 2 3
do
	for i in $(cat $CGROUP_ROOT/tasks)
	do
		echo $i > $CGROUP_ROOT/native/tasks
	done

	root_tasks=$(cat $CGROUP_ROOT/tasks)
	if [ -z "$root_tasks" ]
	then
		break
	fi
done


# Check if we failed to move all tasks from root cgroup
if [ ! -z "$root_tasks" ]
then
	echo "Error: Could not move all tasks to native cgroup"
fi

