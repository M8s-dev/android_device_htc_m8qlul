# vim: ts=4 sw=4 sts=4 et

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192 \
    media.aac_51_output_enabled=true \
    audio.offload.buffer.size.kb=1024 \
    audio.offload.multiple.enabled=false \
    audio.offload.buffer.size.kb=1024 \
    audio.offload.gapless.enabled=false

#added by root-expert
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    voice.playback.conc.disabled=true \
    voice.record.conc.disabled=false \
    htc.audio.skiplowlatency=7 \
    persist.htc.audio.dqlog.dci=1 \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    media.swhevccodectype=0 \
    media.hwhevccodectype=0 \
    mm.enable.smoothstreaming=true \
    mmp.enable.3g2=true


PRODUCT_PROPERTY_OVERRIDES += \
    mm.enable.smoothstreaming=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    audio.offload.disable=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence

PRODUCT_PROPERTY_OVERRIDES += \
    use.voice.path.for.pcm.voip=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.preview.size=1920x1080 \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true 

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

# OMX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true \
    ro.qualcomm.cabl=0 \
    ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.netmgrd.qos.enable=true \
    ro.use_data_netmgrd=true

# Radio - added by root-expert
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=3 \
    persist.radio.adb_log_on=1 \
    persist.radio.fill_eons=1 \
    DEVICE_PROVISIONED=1 \
    persist.cne.feature=0 \
    ro.ril.telephony.mqanelements=5

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=true

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true

#####################################################
# Start of void's additions based on stock htc_m8qlul
#####################################################

# ActivityManager optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.max_starting_bg=4

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    tunnel.audio.encode=false \
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
    rild.libpath=/system/lib64/libhtc_rilhook.so \
    ro.baseband.arch=msm \
    ro.telephony.default_network=9

# Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Persistent Data Block service
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Additionals, yes, more, from yours truly
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnGsmDevice=1 \
    telephony.lteOnCdmaDevice=1

