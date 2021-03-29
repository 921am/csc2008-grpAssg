﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InmateProgress.aspx.cs" Inherits="DB_WebApp.InmateProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfInmateProgressID" runat="server" />
            <table>
                    <%--<tr>
                    <td>
                        <asp:Label ID="lblInmateProgressID" runat="server" Text="Progress ID"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtInmateProgressID" runat="server"></asp:TextBox>
                    </td>
                    </tr>--%>

                <tr>
                    <td>
                        <asp:Label ID="lblInmateID" runat="server" Text="Inmate ID"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtInmateID" runat="server"></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblRehabProgID" runat="server" Text="Rehab Prog ID"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtRehabProgID" runat="server"></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblAcadProgID" runat="server" Text="Acad Prog ID"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAcadProgID" runat="server"></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblVocProgID" runat="server" Text="Vocational Prog ID"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtVocProgID" runat="server"></asp:TextBox>
                    </td>
                    </tr>

               

                
                <tr>
                <td>
                    
                </td>
                <%--<td colspan="2">
                    <asp:Button ID="btnSaveInmate" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDeleteInmate" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnClearInmate" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </td>--%>
            </tr>
                <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                </td>
                <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            </tr>
            </table>
            <br />
            <asp:GridView ID="gvInmateProgress" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="inmateName" HeaderText="Inmate" />
                <asp:BoundField DataField="ProgName" HeaderText="Rehab Programme" />
                <asp:BoundField DataField="RehabProgStatus" HeaderText="Status"/>
                <asp:BoundField DataField="ProgName" HeaderText="Acad Programme"/>
                <asp:BoundField DataField="AcadProgStatus" HeaderText="Status" />
                <asp:BoundField DataField="ProgName" HeaderText="Vocational Programme" />
                <asp:BoundField DataField="VocProgStatus" HeaderText="Status" />
                

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkViewInmate" runat="server" CommandArgument='<%# Eval("InmateProgressID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            <br />
                    <asp:Button ID="btnAcadProg" runat="server" Text="Academic Programmes" OnClick="btnAcadProg_Click" />
                    <asp:Button ID="btnDrugRehab" runat="server" Text="Drug Rehab Programmes" OnClick="btnDrugRehab_Click" />
                    <asp:Button ID="btnVocProg" runat="server" Text="Vocational Programmes" OnClick="btnVocProg_Click" /></br>
                    <asp:Button ID="btnInmates" runat="server" Text="Inmates" OnClick="btnInmates_Click" />
                    <asp:Button ID="btnUsers" runat="server" Text="Users" OnClick="btnUsers_Click" />
                    <asp:Button ID="btnInmateProgress" runat="server" Text="Inmate Progress" OnClick="btnInmateProgress_Click" />
        </div>
    </form>
</body>
</html>