<%@ Page Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="clientregistrationform.aspx.cs" Inherits="registrationform" Title="Event Management System" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="about">Client Registration..!! </h2>
        
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
                    Name:
                    </td>
                    <td >
                    <asp:TextBox ID="txtname" cssclass="textboxEffect" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtname"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    <tr>
                   
                    
                    <td align="right"  >
                    Last Name:
                    </td>
                    <td >
                    <asp:TextBox ID="txtsurname" cssclass="textboxEffect" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtsurname" runat="server" ControlToValidate="txtsurname"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    
                   
                   
                   
                    
                    <tr>
                    <td align="right"  >
                     City:
                    </td>
                    <td>
                    <asp:DropDownList ID="drpcity" cssclass="dropdownEffect" runat="server" > </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="drpcity"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    
                     <tr>
                    <td align="right"  >
                     Area:
                    </td>
                    <td>
                    <asp:TextBox ID="txtarea" cssclass="textboxEffect" runat="server"> </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvarea" runat="server" ControlToValidate="txtarea"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                   
                
                  
                    <tr>
                    <td align="right" >
                     Contact no:
                    </td>
                    <td>
                    <asp:TextBox ID="txtcontactno" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvcontactno" runat="server" ControlToValidate="txtcontactno"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic" 
                                EnableViewState="False"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcontactno" ValidationExpression="^\d+$"  ErrorMessage="Numeric Number Only "></asp:RegularExpressionValidator>
                    
                    </td>
                    </tr>
                    
                     <tr>
                    <td align="right"   >
                     Email Id:
                    </td>
                    <td>
                    <asp:TextBox ID="txtemailid" cssclass="textboxEffect" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvemailid" runat="server" ControlToValidate="txtemailid"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revemailid" 
                            runat="server" ControlToValidate="txtemailid" 
                            ErrorMessage="Incorrect Syntax" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            
                    </td>
                         
                    </tr>
                  
                    <tr>
                    <td align="right"   >
                     Website:
                    </td>
                    <td>
                    <asp:TextBox ID="txtwebsite" cssclass="textboxEffect" runat="server"></asp:TextBox>
                          
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
                     Password:
                    </td>
                    <td>
                    <asp:TextBox ID="txtpassword" TextMode="Password" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpassword"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                  
                    
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Submit" OnClick="btnDivAdd_Click"
                                 EnableViewState="False" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" CausesValidation="false" Text="Reset" OnClick="btnDivCancel_Click"
                                EnableViewState="False" />
                        </td>
                    </tr>


                      <tr>
                        <td colspan="2" align="center">
                            
                             <asp:HyperLink ID="HyperLink1" runat="server"  Font-Underline="true" ForeColor="blue" NavigateUrl="~/clientlogin.aspx">Go to Login Form..!!></asp:HyperLink>
                        </td>
                    </tr>

                    
                </table>
            </asp:Panel>
        </div>
    
    

</div>

</asp:Content>

