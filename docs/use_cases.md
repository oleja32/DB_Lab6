# Модель прицедентів

## Загальна схема

![Загальна схема](//www.plantuml.com/plantuml/png/bPJFQjj04CRlVeebT-S9YeaJGJ4OQZ1xwsLhBux1NWMjH2yz93PfUoYajCM5Njf7KDMu5KwSliBi6tLsf4qbf7Mf3yB-DFFxvi-kJtGieZXPBZfY4eSHEuAFPcEkpCgyEs92iwU9r767uSUz_m8FvX9oYbb31gbvGv5SowWM-1vkuTviO5y2Bp5qPPCfl3zTpbM74X8j9q9BTlJaHO_yZiTIH9Dp_CcUAmPVCUajUkqO4bFOe_arWn-e8XQsS5zKElR1vZF5Bnpi6spDfyTwNcDjDmmoPguWTpYpAO7y076W7F63kSOkRvbProdhaZ9eTcbdTJmCPs4IFr8WBpcmQquOKeRlVjKC82_cFdpMpl_t4Dkjt43vk9qRX2_L8XHJH_wCkCmYpGgVFp5_ZzzlQZvK-HQjCdgcXK7GRi0l_XD_k0q-QYw0Jfz_0wdlw1xOGtyuyDYSdGiraxQraOoMSwtdeT9_soCZ1CDlouVCSm0esb_OGzbk_uoFF7MS2cMBg0xsEznXvgvqMK7kCI_Gfzn33kH2nZ8GiQWCanPqrx8l_mY3W0peGLUDTPDk3-zGK-4DoLqqsoD9xcfKbN55YAp0HnLbQfMWm51dhBj02LVBgXecqfoh8kNIX9n4ZjHJNNlL8xUABMdKIkT4gYd-6_y1)

яка буде відображена наступним чином

@startuml
    right header
        <font size=24 color=black>Package: <b>UCD_3.0
    end header
    title
        <font size=18 color=black>UC_8. Редагувати конфігурацію порталу
        <font size=16 color=black>Діаграма прецедентів
    end title
    actor "Користувач" as User #eeeeaa
    package UCD_1{
        usecase "<b>UC_1</b>\nПереглянути список \nзвітів" as UC_1 #aaeeaa
    }
    usecase "<b>UC_1.1</b>\nЗастосувати фільтр" as UC_1.1
    usecase "<b>UC_1.2</b>\nПереглянути метадані \nзвіту" as UC_1.2  
    usecase "<b>UC_1.2.1</b>\nДати оцінку звіту" as UC_1.2.1  
    usecase "<b>UC_1.2.2</b>\nПереглянути інформацію \nпро авторів звіту" as UC_1.2.2
    package UCD_1 {
        usecase "<b>UC_4</b>\nВикликати звіт" as UC_4 #aaeeaa
    }
    usecase "<b>UC_1.1.1</b>\n Використати \nпошукові теги" as UC_1.1.1  
    usecase "<b>UC_1.1.2</b>\n Використати \nрядок пошуку" as UC_1.1.2
    usecase "<b>UC_1.1.3</b>\n Використати \nавторів" as UC_1.1.3  
    User -> UC_1
    UC_1.1 .u.> UC_1 :extends
    UC_1.2 .u.> UC_1 :extends
    UC_4 .d.> UC_1.2 :extends
    UC_1.2 .> UC_1.2 :extends
    UC_1.2.1 .u.> UC_1.2 :extends
    UC_1.2.2 .u.> UC_1.2 :extends
    UC_1 ..> UC_1.2.2 :extends
    UC_1.1.1 -u-|> UC_1.1
    UC_1.1.2 -u-|> UC_1.1
    UC_1.1.3 -u-|> UC_1.1
    right footer
        Аналітичний портал. Модель прецедентів.
        НТУУ КПІ ім.І.Сікорського
        Киів-2020
    end footer
@enduml



