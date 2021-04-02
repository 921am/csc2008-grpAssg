<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InmateCRUD.aspx.cs" Inherits="DB_WebApp.InmateCRUD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfInmateID" runat="server" />
            <table>
                    <tr>
                    <td>
                        <asp:Label ID="lblInmateName" runat="server" Text="Name"></asp:Label>

                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtInmateName" runat="server"></asp:TextBox>
                    </td>
                    </tr>

                   <tr>
                       <td>
                        <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                        </td>
                
                    <td colspan="2">
                        <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                       <td>
                        <asp:Label ID="lblDateEntered" runat="server" Text="Date Entered"></asp:Label>
                        </td>

                    <td colspan="2">
                        <asp:TextBox ID="txtDateEntered" runat="server"></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                       <td>
                        <asp:Label ID="lblDateReleased" runat="server" Text="Date Released"></asp:Label>
                        </td>

                    <td colspan="2">
                        <asp:TextBox ID="txtDateReleased" runat="server" ></asp:TextBox>
                    </td>
                    </tr>
                
                <tr>
                       <td>
                        <asp:Label ID="lblDrugOffender" runat="server" Text="Drug Offender (True/False)"></asp:Label>
                        </td>

                    <td colspan="2">
                        <asp:TextBox ID="txtDrugOff" runat="server" ></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                       <td>
                        <asp:Label ID="lblEnrolled" runat="server" Text="Enrolled to a programme (Yes/No)"></asp:Label>
                        </td>

                    <td colspan="2">
                        <asp:TextBox ID="txtEnrolled" runat="server" ></asp:TextBox>
                    </td>
                    </tr>
                
                <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Button ID="btnSaveInmate" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDeleteInmate" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnClearInmate" runat="server" Text="Clear" OnClick="btnClear_Click" />
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
            <asp:GridView ID="gvInmate" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="inmateName" HeaderText="Inmate Name" />
                <asp:BoundField DataField="gender" HeaderText="Gender" />
                <asp:BoundField DataField="DateEntered" HeaderText="Entered" DataFormatString="{0:d}"/>
                <asp:BoundField DataField="DateReleased" HeaderText="Released" DataFormatString="{0:d}"/>
                <asp:BoundField DataField="DrugOffender" HeaderText="Drug Off." />
                <asp:BoundField DataField="Enrolled" HeaderText="Enrolled to a programme" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkViewInmate" runat="server" CommandArgument='<%# Eval("inmateID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
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
