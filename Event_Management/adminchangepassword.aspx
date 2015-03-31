<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminchangepassword.aspx.cs" Inherits="adminchangepassword" Title="Admin Change Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2 class="about">Change Password..!! </h2>
   <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
        <table id="Table5">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    
                     
                  
                     <tr>
                    <td align="right" >
                     Username:
                    </td>
                    <td>
                    <asp:TextBox ID="txtuname" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvuname" runat="server" ControlToValidate="txtuname"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    
                    
                   
                      <tr>
                    <td align="right"  >
                    Old Password:
                    </td>
                    <td>
                    <asp:TextBox ID="txtoldpassword" TextMode="Password" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtoldpassword"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                  
                    <tr>
                    <td align="right"  >
                    New Password:
                    </td>
                    <td>
                    <asp:TextBox ID="txtnewpassword" TextMode="Password" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnewpassword"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                  




                    
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Submit"
                                 EnableViewState="False" onclick="btnlogin_Click" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" Text="Reset" 
                                EnableViewState="False" onclick="btnreset_Click" CausesValidation="false" />
                                   <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            

                        </td>
                    </tr>

                      


                </table>
      
        
    
 </asp:Panel>
        </div>
    
 
    
            
    
</asp:Content>

