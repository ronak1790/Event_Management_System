<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="clientforgetpassword.aspx.cs" Inherits="clientforgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2 class="about">
        Forgot Password
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
                <table id="Table5">
                    
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td align="right">
                             Username:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtuname" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuname"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                          Email Address:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtemail" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvdiv" runat="server" ControlToValidate="txtemail"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                     
                
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Submit" OnClick="btnDivAdd_Click"
                                 EnableViewState="False" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" CausesValidation="false" Text="Cancel" 
                                EnableViewState="False" />
                        </td>
                    </tr>
                    
                    <tr>
                    <td colspan="2" align="center">
                        <asp:Label runat="server" ID="lbltotal"  ForeColor="Red" EnableViewState="false"></asp:Label>
                     </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            Go to login page 
                             <asp:HyperLink ID="HyperLink1" runat="server"  Font-Underline="true" ForeColor="blue" NavigateUrl="~/clientlogin.aspx">Click here--></asp:HyperLink>
                        </td>
                    </tr>
                    
                   
                </table>
            </asp:Panel>
        </div>
        </div>
</asp:Content>

