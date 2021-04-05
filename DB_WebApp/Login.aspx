<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DB_WebApp.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
<%--        <form id="loginForm" runat="server">  --%>
        <div>  
                <div class="form-group">
            <asp:Label ID="lblName" runat="server" Font-Size="X-Large" Text="Name :"></asp:Label>  
             <asp:TextBox ID="tbName" runat="server" Font-Size="X-Large" class="form-control"></asp:TextBox> 
        </div>
                    <div class="form-group">
            <asp:Label ID="lblPwd" runat="server" Font-Size="X-Large" Text="Password :"></asp:Label>  
            <asp:TextBox ID="tbPwd" runat="server" Font-Size="X-Large" TextMode="Password" class="form-control"></asp:TextBox>  
        </div>
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" BorderStyle="None" Font-Size="X-Large" OnClick="btnLogin_Click" Text="Log In" class="btn btn-primary" />  
        </div>
        <div class="form-group">
            <asp:Label ID="lblLoginErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
        
        </div>  
<%--        </form>  --%>
</asp:Content>
