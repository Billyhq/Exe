use File::Basename;
use File::Find;
use File::Copy;

@target_files=("src/bcmsdio/sys/bcmsdh.c",	
    "src/bcmsdio/sys/bcmsdh_linux.c",
    "src/bcmsdio/sys/bcmsdh_sdmmc.c",
    "src/bcmsdio/sys/bcmsdh_sdmmc_linux.c",
    "src/dhd/sys/dhd_bta.c",
    "src/dhd/sys/dhd_cdc.c",
    "src/dhd/sys/dhd_common.c",
    "src/dhd/sys/dhd_custom_gpio.c",
    "src/dhd/sys/dhd_custom_sec.c",
    "src/dhd/sys/dhd_linux.c",	
    "src/dhd/sys/dhd_linux_sched.c",
    "src/dhd/sys/dhd_cfg80211.c",
    "src/dhd/sys/dhd_sdio.c",
    "src/shared/aiutils.c",
    "src/shared/bcmevent.c",
    "src/shared/bcmutils.c",
    "src/wl/bcmwifi/src/bcmwifi_channels.c",
    "src/shared/hndpmu.c",
    "src/shared/linux_osl.c",
    "src/shared/sbutils.c",
    "src/shared/siutils.c",
    "src/wl/sys/wl_android.c",
    "src/wl/sys/wl_cfg80211.c",
    "src/wl/sys/wl_cfgp2p.c",
    "src/wl/sys/wldev_common.c",
    "src/wl/sys/wl_linux_mon.c",
	"src/wl/sys/wl_roam.c",
    "src/dhd/sys/bcmon.c");
@src_dir = ("D:/src code/git/WiFi Driver/android-exynos-3.4/kernel--exynos.android-source-browsing-832523286e7a/drivers/net/wireless/bcmdhd");
$dst_base_dir = 'D:/src code/git/WiFi Driver/compare_file/android-samsung-3.0-jb-mr0';

#create directories
$files_bitmask = 0xFFFFFFFF;
$files_check_count = 0;

find(\&copy_file, @src_dir);

#check not found files
while($files_check_count < @target_files) {
    if( $files_bitmask & (1<<$files_check_count) ) {
        print "$target_files[$files_check_count] not found\n";
    }
    $files_check_count++;
}

sub copy_file {
    $file_count=0;
    $sub_dir_count=0;
    
    while( $file_count < @target_files ) {
        if($files_bitmask & (1<<$file_count)) {
            $one_file = $target_files[$file_count];
            $file_name = basename($one_file);
            if($_ eq $file_name) {
                #print "find a file $File::Find::name\n";

                $dir_name = dirname($one_file);
                @sub_dir_array = split "/", $dir_name;

                chdir $dst_base_dir;
                while( $sub_dir_count < @sub_dir_array ) {
                    if( -e $sub_dir_array[$sub_dir_count] ) {
                    }
                    else {
                        mkdir $sub_dir_array[$sub_dir_count];
                    }
                    chdir $sub_dir_array[$sub_dir_count];                    
                    $sub_dir_count++;
                }
                $files_bitmask &= ~(1<<$file_count);
                if( -e $_ ) {
                }
                else {
                    copy($File::Find::name, $_);
                }
            }
        }
        $file_count++;
    } 
}
