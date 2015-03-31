<%@ Page Title="Admin contact us" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="admincontactus.aspx.cs" Inherits="admincontactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



 <h2 class="about">Contact Us..!! </h2>
        
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
                    Company Name
                    </td>
                    <td >
                    <asp:TextBox ID="txtcompanyname" cssclass="textboxEffect" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtcompanyname"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    <tr>
                   
                    
                    <td align="right"  >
                    Address:
                    </td>
                    <td >
                    <asp:TextBox ID="txtaddress"  cssclass="textboxEffect" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtsurname" runat="server" ControlToValidate="txtaddress"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    
                  
                   
                   
                    
                    <tr>
                    <td align="right"  >
                     Contact No:
                    </td>
                    <td>
                    <asp:TextBox ID="txtcontactno" cssclass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtcontactno"
                                ErrorMessage="Enter Item" Text="Required !"  Display="Dynamic"
                                EnableViewState="False"></asp:RequiredFieldValidator>
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
                    </td>
                    </tr>
                  
                   
                    
                    
                   
                  
                    
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Add / Edit" OnClick="btnDivAdd_Click"
                                 EnableViewState="False" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" CausesValidation="false" Text="Cancel" OnClick="btnDivCancel_Click"
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
                            <%--<div id="Div7" style="overflow-x: auto; overflow-y: auto; width: 100%; height: 340px;"
                        class="thinBorder">--%>
                            <asp:GridView ID="gv1" runat="server" 
                                AutoGenerateColumns="False" DataKeyNames="contact_id"
                                Width="80%" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Company Name" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("contact_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("contact_address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact no">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcontact" runat="server" Text='<%#Eval("contact_contactno") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Order Level">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("contact_email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    
                                  
                                    
                                    
                                    
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvEdit" runat="server" CausesValidation="false" ImageUrl="images/edit.gif" OnClick="ibgvEdit_Click" />&nbsp;
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvDel" runat="server"  CausesValidation="false" ImageUrl="images/del.gif" OnClick="ibgvDel_Click" />&nbsp;
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Record Found.
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <%-- </div>--%>
                        </td>
                    </tr>
                   
                </table>
            </asp:Panel>
        </div>
    
    









</asp:Content>

