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

        $('#BecomeOrgli').hide();




    }
    else if (roleType == 1)//visitor
    {
        $('#loginLi').hide();

        $('#AdminUserli').hide();

        $('#AdminPayinfli').hide();

        $('#Registerli').hide();

        $('#UserHistoryli').hide();

        $('#AdminEMli').hide();

        $('#Ticketsli').hide();

        $('#Organizeli').hide();

        $('#EventManageli').hide();


    }
    else if (roleType == 2)//organizer
    {
        $('#AdminUserli').hide();

        $('#AdminPayinfli').hide();

        $('#AdminEMli').hide();

        $('#loginLi').hide();

        $('#Registerli').hide();

        $('#BecomeOrgli').hide();

    }
    else if (roleType == 3)//Admin
    {
        $('#loginLi').hide();

        $('#EventManageli').hide();

        $('#Ticketsli').hide();

        $('#Organizeli').hide();

        $('#UserHistoryli').hide();

        $('#Myprofileli').hide();

        $('#BecomeOrgli').hide();

        $('#Registerli').hide();

        $('#Eventli').hide();


    }
    else {
        var d = '';
    }


  

}
//  $.datepicker.setDefaults({ dateFormat: 'yyyy-mm-dd' });