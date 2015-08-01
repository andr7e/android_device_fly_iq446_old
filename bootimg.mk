$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) $(recovery_kernel)

	@echo ----- Making recovery image ------
	cp $(MTK_TOOLS_DIR)/repack-MT65xx.pl repack-MT65xx.pl
	cp $(MTK_TOOLS_DIR)/mkbootimg mkbootimg
	perl repack-MT65xx.pl -recovery $(recovery_kernel) $(PRODUCT_OUT)/recovery/root $@
	@echo ----- Made recovery image -------- $@
	rm -rf repack-MT65xx.pl mkbootimg

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_RAMDISK_TARGET) $(INSTALLED_KERNEL_TARGET) $(TARGET_ROOT_OUT)
	
	@echo ----- Making boot image ------
	cp $(MTK_TOOLS_DIR)/repack-MT65xx.pl repack-MT65xx.pl
	cp $(MTK_TOOLS_DIR)/mkbootimg mkbootimg
	perl repack-MT65xx.pl -boot $(INSTALLED_KERNEL_TARGET) $(TARGET_ROOT_OUT) $@
	@echo ----- Made boot image -------- $@
	rm -rf repack-MT65xx.pl mkbootimg
