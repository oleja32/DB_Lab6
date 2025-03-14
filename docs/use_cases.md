# Модель прицедентів

## Загальна схема

![Загальна схема](//www.plantuml.com/plantuml/png/bPJFQjj04CRlVeebT-S9YeaJGJ4OQZ1xwsLhBux1NWMjH2yz93PfUoYajCM5Njf7KDMu5KwSliBi6tLsf4qbf7Mf3yB-DFFxvi-kJtGieZXPBZfY4eSHEuAFPcEkpCgyEs92iwU9r767uSUz_m8FvX9oYbb31gbvGv5SowWM-1vkuTviO5y2Bp5qPPCfl3zTpbM74X8j9q9BTlJaHO_yZiTIH9Dp_CcUAmPVCUajUkqO4bFOe_arWn-e8XQsS5zKElR1vZF5Bnpi6spDfyTwNcDjDmmoPguWTpYpAO7y076W7F63kSOkRvbProdhaZ9eTcbdTJmCPs4IFr8WBpcmQquOKeRlVjKC82_cFdpMpl_t4Dkjt43vk9qRX2_L8XHJH_wCkCmYpGgVFp5_ZzzlQZvK-HQjCdgcXK7GRi0l_XD_k0q-QYw0Jfz_0wdlw1xOGtyuyDYSdGiraxQraOoMSwtdeT9_soCZ1CDlouVCSm0esb_OGzbk_uoFF7MS2cMBg0xsEznXvgvqMK7kCI_Gfzn33kH2nZ8GiQWCanPqrx8l_mY3W0peGLUDTPDk3-zGK-4DoLqqsoD9xcfKbN55YAp0HnLbQfMWm51dhBj02LVBgXecqfoh8kNIX9n4ZjHJNNlL8xUABMdKIkT4gYd-6_y1)

</center>

## Гість

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 1em;"
>
 
```plantuml
@startuml

    actor "Гість" as Guest
    
    usecase "<b>Guest.Search<b> \n Пошук даних гостем" as GS
    usecase "<b>Guest.SignUp<b> \n Реєстрація в системі" as GSU
    usecase "<b>Guest.SignIn<b> \n Вхід у систему" as GSI
    
    Guest -u-> GS
    Guest -u-> GSU
    Guest -u-> GSI   

@enduml
```

</center>



