<%@ Page Title="Academic Programme" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AcadProgrammeCRUD.aspx.cs" Inherits="DB_WebApp.AcadProgrammeCRUD" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
        <div>
            <asp:HiddenField ID="hfAcadProgID" runat="server" />
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
                 <%-- change to drop down --%>
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
            <asp:GridView ID="gvAcadProg" runat="server" AutoGenerateColumns="false">
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
        </div>
</asp:Content>