<%@ Page Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="JoinUs.aspx.cs"
    Inherits="JoinUs" Title="Event Management System" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Client Registration..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
                <table id="Table5">
                    <%-- <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="vs" runat="server"  />
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtname" Width="100px" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtname"
                                ErrorMessage="Enter Category" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Surname:
                        </td>
                        <td>
                            <asp:TextBox ID="txtsurname" Width="100px" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtsurname" runat="server" ControlToValidate="txtsurname"
                                ErrorMessage="Enter Category" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Address:
                        </td>
                        <td>
                            <asp:TextBox ID="txtaddress" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddress"
                                ErrorMessage="Enter Category" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            City:
                        </td>
                        <td>
                            <asp:TextBox ID="txtcity" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtcity"
                                ErrorMessage="Enter Item" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Contact no:
                        </td>
                        <td>
                            <asp:TextBox ID="txtcontactno" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvcontactno" runat="server" ControlToValidate="txtcontactno"
                                ErrorMessage="Enter Item" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Email Id:
                        </td>
                        <td>
                            <asp:TextBox ID="txtemailid" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvemailid" runat="server" ControlToValidate="txtemailid"
                                ErrorMessage="Enter Item" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Website:
                        </td>
                        <td>
                            <asp:TextBox ID="txtwebsite" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="rfvcontact" runat="server" ControlToValidate="txtcontactno"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Username:
                        </td>
                        <td>
                            <asp:TextBox ID="txtuname" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvuname" runat="server" ControlToValidate="txtuname"
                                ErrorMessage="Enter Item" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="txtpassword" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpassword"
                                ErrorMessage="Enter Item" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Add / Edit" OnClick="btnDivAdd_Click"
                                EnableViewState="False" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" CausesValidation="false"
                                Text="Cancel" OnClick="btnDivCancel_Click" EnableViewState="False" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
