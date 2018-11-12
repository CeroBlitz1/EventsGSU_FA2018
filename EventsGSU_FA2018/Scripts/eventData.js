function validateRoles(roleType) {
    debugger;
    if (roleType == 0)
    {
        $('#AdminUserli').hide();

        $('#AdminPayinfli').hide();

        $('#EventManageli').hide();

        $('#Ticketsli').hide();

        $('#Organizeli').hide();

        $('#UserHistoryli').hide();

        $('#Myprofileli').hide();

        $('#AdminEMli').hide();

        $('#Logoutli').hide();





    }
    else if (roleType == 1)//visitor
    {
        $('#loginLi').hide();

        $('#AdminUserli').hide();

        $('#AdminPayinfli').hide();

        $('#Ticketsli').hide();

        $('#Registerli').hide();

        $('#AdminEMli').hide();


    }
    else if (roleType == 2)//organizer
    {
        $('#AdminUserli').hide();

        $('#AdminPayinfli').hide();

        $('#AdminEMli').hide();

        $('#loginLi').hide();

        $('#Registerli').hide();

    }
    else if (roleType == 3)//Admin
    {
        $('#loginLi').hide();

        $('#EventManageli').hide();

        $('#Ticketsli').hide();

        $('#Organizeli').hide();

        $('#UserHistoryli').hide();

        $('#Myprofileli').hide();


    }
    else {
        var d = '';
    }

}