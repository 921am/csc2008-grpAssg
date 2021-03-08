<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DB_WebApp.Login" %>
  
<!DOCTYPE html>  
  
<html xmlns="http://www.w3.org/1999/xhtml">  
    <head runat="server">  
        <title></title>  
        <style type="text/css">  
            .auto-style1 {  
                width: 100%;  
            }  
        </style>  
    </head>  
    <body>  
        <form id="loginForm" runat="server">  
        <div>  
        
            <table class="auto-style1">  
                <tr>  
                    <td colspan="6" style="text-align: center; vertical-align: top">  
                        <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Log In "></asp:Label>  
                    </td>  
                </tr>  
                <tr>  
                    <td> </td>  
                    <td style="text-align: center">  
                        <asp:Label ID="lblName" runat="server" Font-Size="X-Large" Text="Name :"></asp:Label>  
                    </td>  
                    <td style="text-align: center">  
                        <asp:TextBox ID="tbName" runat="server" Font-Size="X-Large"></asp:TextBox>  
                    </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                </tr>  
                <tr>  
                    <td> </td>  
                    <td style="text-align: center">  
                        <asp:Label ID="lblPwd" runat="server" Font-Size="X-Large" Text="Password :"></asp:Label>  
                    </td>  
                    <td style="text-align: center">  
                        <asp:TextBox ID="tbPwd" runat="server" Font-Size="X-Large" TextMode="Password"></asp:TextBox>  
                    </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                </tr>  
                <tr>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                </tr>  
                <tr>  
                    <td> </td>  
                    <td> </td>  
                    <td style="text-align: center">  
                        <asp:Button ID="btnLogin" runat="server" BorderStyle="None" Font-Size="X-Large" OnClick="Button1_Click" Text="Log In" />  
                    </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                </tr>  
                <tr>  
                    <td> </td>  
                    <td> </td>  
                    <td>  
                        <asp:Label ID="lblLoginErrorMsg" runat="server" Font-Size="X-Large"></asp:Label>  
                    </td>  
                    <td> </td>  
                    <td> </td>  
                    <td> </td>  
                </tr>  
            </table>  
        
        </div>  
        </form>  
    </body>  
</html>  
