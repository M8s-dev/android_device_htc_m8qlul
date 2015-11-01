# vim: ts=4 sw=4 sts=4 et

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    av.offload.enable=false

PRODUCT_PROPERTY_OVERRIDES += \
    mm.enable.smoothstreaming=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence

PRODUCT_PROPERTY_OVERRIDES += \
    use.voice.path.for.pcm.voip=true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=420

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    ro.gps.agps_provider=1

# NITZ
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3=""

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true \
    ro.qualcomm.cabl=0 \
    ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.netmgrd.qos.enable=true \
    ro.use_data_netmgrd=true

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=true

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false

# Recovery
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.cwm.forbid_format=/boot,/firmware,/mpt,/persist,/persist-lg,/sns

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true

#####################################################
# Start of void's additions based on stock htc_m8qlul
#####################################################

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.isa.arm64.features=div

# ActivityManager optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.max_starting_bg=8

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    tunnel.audio.encode=false \
    audio.offload.buffer.size.kb=1024 \
    audio.offload.min.duration.secs=30 \
    audio.offload.gapless.enabled=false \
    vidc.enc.narrow.searchrange=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Dexopt - limit to 4 cores
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=4

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=gpu \
    debug.enable.sglscale=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    mm.enable.qcom_parser=3314291 \
    drm.service.enabled=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ril.ecclist=112,911,113,114,115,118,000,08,110,999,119 \
    ril.subscription.types=NV,RUIM \
    rild.libargs=-d/dev/smd0 \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    ro.baseband.arch=msm \
    ro.telephony.default_network=9

# Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=row

#Storage
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=true

# Persistent Data Block service
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/pdata

# Additionals, yes, more, from yours truly
PRODUCT_PROPERTY_OVERRIDES += \
telephony.lteOnCdmaDevice=1

