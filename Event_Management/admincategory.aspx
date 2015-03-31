<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="admincategory.aspx.cs"
    Inherits="admincategory" Title="Admin Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Category..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
                <table id="Table5">
                    <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="vs" runat="server"  />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Category :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCategory" cssclass="textboxEffect" MaxLength="50"  runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvdiv" runat="server" ControlToValidate="txtCategory"
                                ErrorMessage="Enter Category" Text="Required !"  Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top"  >
                            Description :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtdesc"  runat="server" TextMode="MultiLine" Columns="35" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtdesc" runat="server" Text="*" 
                                ControlToValidate="txtdesc" Display="Dynamic"  SetFocusOnError="True"
                                 EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                     <td align="right">
                            Order Level:
                     </td>
                     
                     <td>
                        <asp:TextBox ID="txtorderlevel" Width="50px" CssClass="textboxEffect" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvorder" runat="server" Text="*"
                                ControlToValidate="txtdesc" Display="Dynamic" SetFocusOnError="True"
                                 EnableViewState="False"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtorderlevel" ValidationExpression="^\d+$"  ErrorMessage="Numeric Number Only "></asp:RegularExpressionValidator>
                    
                       
                     </td>  
                     
                     </tr>
                     <tr>
                        <td align="right">
                            IsActive:
                        </td>
                        <td align="left">
                            <asp:CheckBox ID="chkIsActive" runat="server" />
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
                      
                            <asp:GridView ID="gv1" runat="server" AllowPaging="true" PageSize="7" 
                                AutoGenerateColumns="False" DataKeyNames="cat_id"
                                Width="80%" onpageindexchanging="gv1_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="Category" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblcatname" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category Description" Visible="false" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblcatdesc" runat="server" Text='<%#Eval("cat_description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Order Level">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcatorderby" runat="server" Text='<%#Eval("cat_orderby") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="IsActive">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkcategory" runat="server" Checked='<%#Eval("cat_isactive") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvEdit" runat="server" CausesValidation="false" ImageUrl="images/edit.gif" OnClick="ibgvEdit_Click" />&nbsp;
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvDel" runat="server"  CausesValidation="false" ImageUrl="images/del.gif" OnClick="ibgvDel_Click" OnClientClick="return confirm('Are you sure to delete this Category?')" />&nbsp;
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
        </div>
</asp:Content>
