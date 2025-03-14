# Модель прицедентів

## Загальна схема

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 1em;"
>


@startuml

    actor "Гість" as Guest
    actor "Користувач" as User
    actor "Адміністратор" as Admin

    usecase "<b>Guest.Search<b> \n Пошук даних гостем" as GS
    usecase "<b>Guest.SignUp<b> \n Реєстрація в системі" as GSU
    usecase "<b>Guest.SignIn<b> \n Вхід у систему" as GSI

    usecase "<b>User.Logout<b> \n Вихід користувача із системи" as ULO
    usecase "<b>User.Search<b> \n Пошук даних користувачем" as US
    usecase "<b>User.Download<b> \n Завантаження даних з сервера" as UD
    usecase "<b>User.Upload<b> \n Завантаження даних користувачем" as UUP

    usecase "<b>Admin.Logout<b> \n Вихід адміністратора із системи" as ALI
    usecase "<b>Admin.ChangeUserPermissions<b> \n Зміна прав користувача \n адміністратором" as ACUP
    usecase "<b>Admin.BanUser<b> \n Заблокувати користувача" as ABU
    usecase "<b>Admin.DeleteData<b> \n Видалення даних із системи" as ADD
    
    Guest -u-> GS
    Guest -u-> GSU
    Guest -u-> GSI

    User -u-> ULO
    User -u-> US
    User -r-> UUP
    User -d-> UD

    Admin -l-> ALI 
    Admin -r-> ACUP 
    Admin -d-> ABU
    Admin -u-> ADD

    Admin -u-|> User
    User -u-|> Guest

@enduml


</center>

яка буде відображена наступним чином

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 1em;"
    >


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


</center>

