<%@ Page Title="Inmate Progress" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InmateProgress.aspx.cs" Inherits="DB_WebApp.InmateProgress" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div>
        <asp:HiddenField ID="hfInmateProgressID" runat="server" />
        <div class="form-group">
            <asp:Label ID="lblInmateID" runat="server" Text="Inmate ID"></asp:Label>
            <asp:TextBox ID="txtInmateID" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblRehabProgID" runat="server" Text="Rehab Prog ID"></asp:Label>
            <asp:TextBox ID="txtRehabProgID" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblAcadProgID" runat="server" Text="Acad Prog ID"></asp:Label>
            <asp:TextBox ID="txtAcadProgID" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblVocProgID" runat="server" Text="Vocational Prog ID"></asp:Label>
            <asp:TextBox ID="txtVocProgID" runat="server" class="form-control"></asp:TextBox>
        </div>
<%--        <div class="form-group">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" class="btn btn-danger" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-secondary" />
        </div>--%>
        <div class="form-group">
            <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
        <br />
        <asp:GridView ID="gvInmateProgress" runat="server" AutoGenerateColumns="false" class="table table-striped table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:BoundField DataField="inmateName" HeaderText="Inmate" />
                <asp:BoundField DataField="RehabProgName" HeaderText="Rehab Programme" />
                <asp:BoundField DataField="RehabProgStatus" HeaderText="Status" />
                <asp:BoundField DataField="AcadProgName" HeaderText="Acad Programme" />
                <asp:BoundField DataField="AcadProgStatus" HeaderText="Status" />
                <asp:BoundField DataField="VocProgName" HeaderText="Vocational Programme" />
                <asp:BoundField DataField="VocProgStatus" HeaderText="Status" />


                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkViewInmate" runat="server" CommandArgument='<%# Eval("InmateProgressID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </div>

</asp:Content>
