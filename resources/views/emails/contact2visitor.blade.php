<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact email</title>
</head>
<body>
<center>
    <div style="background: #fafafa; padding: 15px;" border="0" cellpadding="0" cellspacing="0">
        <table width="600" align="center">
            <tr>
                <td align="center" valign="top">
                    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                        <tr>
                            <td align="center" valign="top">
                                <table border="0" cellpadding="0" cellspacing="0" width="600">
                                    <tr>
                                        <td align="center" valign="top">
                                            <p style="text-align: left">
                                                Hello {{ $input['name'] ?? '[name]' }},
                                            </p>

                                            <p style="text-align: left">
                                                Thank you for contacting {{env('APP_NAME')}}. We would like to confirm your information as follows:
                                            </p>
                                            <div style="text-align: left">- Name: {{ $input['name'] ?? '[name]' }}</div>
                                            <div style="text-align: left">- Phone: {{ $input['phone'] ?? '[phone]' }}</div>
                                            <div style="text-align: left">- E-mail: {{ $input['email'] ?? '[email]' }}</div>
                                            <div style="text-align: left">- Company: {{ $input['company'] ?? '[company]' }}</div>
                                            <div style="text-align: left">- Subject: {{ $input['subject'] ?? '[subject]' }}</div>
                                            <div style="text-align: left">- Company profile:
                                                <p>{{ $input['company_profile'] ?? '[company_profile]' }}</p>
                                            </div>
                                            <div style="text-align: left">- Information:
                                                <p>{{ $input['information'] ?? '[information]' }}</p>
                                            </div>

                                            <p style="text-align: left">
                                                Our customer care staff will contact you as soon as possible. In the meantime, if you need more requests or need assistance, please contact {{env ('APP_NAME')}} directly by phone number: {{\System::content('phone')}} or email: {{\System::content('email')}}
                                            </p>

                                            <p>&nbsp;&nbsp;</p>

                                            <p style="text-align: left">
                                                Thank {{ $input['name'] ?? '[name]' }},
                                                <br>
                                                {{env('APP_NAME')}} – Customer Care Team
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</center>
</body>
</html>