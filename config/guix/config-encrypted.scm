(use-modules
  (gnu)
  (gnu system nss))
(use-service-modules
  desktop
  xorg)
(use-package-modules
  certs
  gnome)
(operating-system
  (host-name "tkiat")
  (timezone "Asia/Bangkok")
  (locale "en_US.utf8")
  (keyboard-layout
    (keyboard-layout "us"
                     "altgr-intl")) ;; The "altgr-intl" variant provides dead keys for accented characters.
  (bootloader
    (bootloader-configuration
      (bootloader
        (bootloader
          (inherit grub-bootloader)
          (installer #~(const #t))))
      (keyboard-layout keyboard-layout)))
  (mapped-devices
    (list
      (mapped-device
        (source
          (uuid "b55ff2af-b0d6-408b-a863-91f0236f9c66"))
          (target "root-encrypted")
          (type luks-device-mapping))))
  (file-systems
    (append
      (list
        (file-system
          (device
            (file-system-label "Guix"))
          (mount-point "/")
          (type "btrfs")
          (dependencies mapped-devices)))
        %base-file-systems))
  (swap-devices '("/swapfile"))
  (users
    (append
      (list
        (user-account
          (name "tkiat")
          (comment "Theerawat Kiatdarakun")
          (group "users")
          (supplementary-groups '("wheel" "netdev" "audio" "video" "lp" "cdrom" "tape" "kvm"))))
      %base-user-accounts))
  (packages
    (append
      (list nss-certs)
      %base-packages))
  (services
    (append
      (list
        (extra-special-file "/usr/bin/env"
          (file-append coreutils "/bin/env"))
        (set-xorg-configuration
          (xorg-configuration
            (keyboard-layout keyboard-layout)))
        (service gnome-desktop-service-type))
      %desktop-services))
  (name-service-switch %mdns-host-lookup-nss)) ;; Allow resolution of '.local' host names with mDNS.
