<%@ Page Title="Inmate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InmateCRUD.aspx.cs" Inherits="DB_WebApp.InmateCRUD" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div>
        <asp:HiddenField ID="hfInmateID" runat="server" />
        <div class="form-group">
            <asp:Label ID="lblInmateName" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtInmateName" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
            <asp:TextBox ID="txtGender" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblDateEntered" runat="server" Text="Date Entered"></asp:Label>
            <asp:TextBox ID="txtDateEntered" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblDateReleased" runat="server" Text="Date Released"></asp:Label>
            <asp:TextBox ID="txtDateReleased" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblDrugOffender" runat="server" Text="Drug Offender (True/False)"></asp:Label>
            <asp:TextBox ID="txtDrugOff" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEnrolled" runat="server" Text="Enrolled to a programme (Yes/No)"></asp:Label><br />
            <asp:TextBox ID="txtEnrolled" runat="server" Enabled="False" class="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSaveInmate" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary" />
            <asp:Button ID="btnDeleteInmate" runat="server" Text="Delete" OnClick="btnDelete_Click" class="btn btn-danger" />
            <asp:Button ID="btnClearInmate" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-secondary" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
        <asp:GridView ID="gvAverage" runat="server" AutoGenerateColumns="false" class="table table-striped table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:BoundField DataField="dummyheader" HeaderText="Avg. Duration of Inmates Enrolled" />
                <asp:BoundField DataField="AvgEnroll" HeaderText="Sentence Duration" />

            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="gvInmate" runat="server" AutoGenerateColumns="false" class="table table-striped table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:BoundField DataField="inmateNameValue" HeaderText="Inmate Name" />
                <asp:BoundField DataField="gender" HeaderText="Gender" />
                <asp:BoundField DataField="DateEntered" HeaderText="Entered" DataFormatString="{0:d}" />
                <asp:BoundField DataField="DateReleased" HeaderText="Released" DataFormatString="{0:d}" />
                <asp:BoundField DataField="DrugOffender" HeaderText="Drug Off." />
                <asp:BoundField DataField="Enrolled" HeaderText="Enrolled to a programme" />
                <asp:BoundField DataField="TimeSpent" HeaderText="Sentence Duration" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkViewInmate" runat="server" CommandArgument='<%# Eval("inmateID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </div>
</asp:Content>
