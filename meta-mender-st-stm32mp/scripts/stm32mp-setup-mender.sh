
# Mender Integration Setup Script

export TEMPLATECONF=${PWD}/layers/meta-st/meta-st-openstlinux/conf/template/

. layers/openembedded-core/oe-init-build-env

# Mender.io
echo "ADDONSLAYERS += \"\${@'\${OEROOT}/layers/meta-mender/meta-mender-core' if os.path.isfile('\${OEROOT}/layers/meta-mender/meta-mender-core/conf/layer.conf') else ''}\"" >> conf/bblayers.conf
echo "ADDONSLAYERS += \"\${@'\${OEROOT}/layers/meta-mender/meta-mender-demo' if os.path.isfile('\${OEROOT}/layers/meta-mender/meta-mender-demo/conf/layer.conf') else ''}\"" >> conf/bblayers.conf
echo "ADDONSLAYERS += \"\${@'\${OEROOT}/layers/meta-mender-community/meta-mender-st-stm32mp' if os.path.isfile('\${OEROOT}/layers/meta-mender-community/meta-mender-st-stm32mp/conf/layer.conf') else ''}\"" >> conf/bblayers.conf

cat ../layers/meta-mender-community/templates/local.conf.append >> conf/local.conf
cat ../layers/meta-mender-community/meta-mender-st-stm32mp/templates/local.conf.append >> conf/local.conf

# STRATIS workaround instead of also having to manage meta-mender-core
sed -i 's@${DEPLOY_DIR_IMAGE}/uboot.env@${DEPLOY_DIR_IMAGE}/u-boot/uboot.env@g' ./layers/meta-mender/meta-mender-core/classes/mender-part-images.bbclass

echo ""
echo "Mender integration complete."
echo ""
