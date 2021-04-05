<%@ Page Title="Drug Rehabilitation Programme" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DrugRehabCRUD.aspx.cs" Inherits="DB_WebApp.DrugRehabCRUD" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
        <div>
            <asp:HiddenField ID="hfDrugRehabID" runat="server" />
            <div class="form-group">
                <asp:Label ID="lblProgName" runat="server" Text="Programme Name"></asp:Label>
                <asp:TextBox ID="txtProgName" runat="server" TextMode="SingleLine" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblProgDescription" runat="server" Text="Programme Description"></asp:Label>
                <asp:TextBox ID="txtProgDescription" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                <asp:TextBox ID="txtStartDate" runat="server" TextMode="DateTime" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEndDate" runat="server" Text="End Date" class="hasDatepicker"></asp:Label>
                <asp:TextBox ID="txtEndDate" runat="server" TextMode="DateTime" class="form-control hasDatepicker"></asp:TextBox>

            </div>
            <div class="form-group">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" class="btn btn-danger" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-secondary" />
            </div>
            <div class="form-group">
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
            <br />
            <asp:GridView ID="gvDrugRehab" runat="server" AutoGenerateColumns="false" class="table table-striped table-bordered table-condensed table-responsive table-hover">
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