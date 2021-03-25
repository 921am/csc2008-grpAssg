<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrugRehabCRUD.aspx.cs" Inherits="DB_WebApp.DrugRehabCRUD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfDrugRehabID" runat="server" />
            <table>
                    <tr>
                    <td>
                        <asp:Label ID="lblProgName" runat="server" Text="Programme Name"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProgName" runat="server"></asp:TextBox>
                    </td>
                    </tr>

                   <tr>
                       <td>
                        <asp:Label ID="lblProgDescription" runat="server" Text="Programme Description"></asp:Label>
                        </td>
                
                    <td colspan="2">
                        <asp:TextBox ID="txtProgDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                       <td>
                        <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                        </td>

                    <td colspan="2">
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="DateTime"></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                       <td>
                        <asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label>
                        </td>

                    <td colspan="2">
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="DateTime"></asp:TextBox>
                    </td>
                    </tr>
               
                
                <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </td>
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
            <asp:GridView ID="gvDrugRehab" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ProgName" HeaderText="Programme Name" />
                <asp:BoundField DataField="ProgDescrip" HeaderText="Description" />
                <asp:BoundField DataField="StartDate" HeaderText="Start"  DataFormatString="{0:d}" />
                <asp:BoundField DataField="EndDate" HeaderText="End"  DataFormatString="{0:d}" />

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ProgID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
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
        </div>
    </form>
</body>
</html>

