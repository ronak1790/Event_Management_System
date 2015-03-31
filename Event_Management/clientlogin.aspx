<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true"
    CodeFile="clientlogin.aspx.cs" Inherits="clientlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Join Us..!!
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
                            <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpassword"
                                ErrorMessage="Enter Item" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Submit" EnableViewState="False"
                                OnClick="btnlogin_Click" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" Text="Reset" EnableViewState="False"
                                OnClick="btnreset_Click" />
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            Forgot Password?
                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="true" ForeColor="blue"
                                NavigateUrl="~/clientforgetpassword.aspx">Click here--></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            Are you a new client?
                            <asp:HyperLink runat="server" Font-Underline="true" ForeColor="blue" NavigateUrl="~/clientregistrationform.aspx">Click here--></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
