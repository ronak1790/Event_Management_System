<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminsubcategory.aspx.cs"
    Inherits="adminsubcategory" Title="Admin Sub-Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Sub-Category.!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
                <table  border="0"  >
                    <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="vs" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Category:
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcategory" runat="server" CssClass="dropdownEffect">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvcategory" runat="server" ControlToValidate="drpcategory"
                                ErrorMessage="Enter Category" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            Sub-Category :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtsubcategory" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvsubcategory" runat="server" ControlToValidate="txtsubcategory"
                                ErrorMessage="Enter Sub Category" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            Description :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Columns="50" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                                ControlToValidate="txtdesc" Display="Dynamic" ErrorMessage="Enter Category" SetFocusOnError="True"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Order By:
                        </td>
                        <td>
                            <asp:TextBox ID="txtorderlevel" Width="50px" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvorder" runat="server" Text="*" ControlToValidate="txtdesc"
                                Display="Dynamic" ErrorMessage="Enter Category" SetFocusOnError="True" EnableViewState="False"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtorderlevel"
                                ValidationExpression="^\d+$" ErrorMessage="Numeric Number Only "></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            IsActive:
                        </td>
                        <td align="left">
                            <asp:CheckBox ID="checksubcat" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Add / Edit" OnClick="btnDivAdd_Click"
                                EnableViewState="False" />&nbsp;
                            <asp:Button ID="btnDivCancel" runat="server" CssClass="subbtn" CausesValidation="false"
                                Text="Cancel" OnClick="btnDivCancel_Click"  />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label runat="server" ID="lbltotal" ForeColor="Red" EnableViewState="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <%--<div id="Div7" style="overflow-x: auto; overflow-y: auto; width: 100%; height: 340px;"
                        class="thinBorder">--%>
                            <asp:GridView ID="gv1" runat="server" PageSize="7" AllowPaging="true" AutoGenerateColumns="False"
                                DataKeyNames="subcat_id" Width="80%" OnPageIndexChanging="gv1_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField Visible="false" HeaderText="category_id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcatid" runat="server" Text='<%#Eval("cat_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcatname" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Category">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubcatname" runat="server" Text='<%#Eval("subcat_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText=" SubCategory Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsubcatdesc" runat="server" Text='<%#Eval("subcat_description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order level">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsubcatorderby" runat="server" Text='<%#Eval("subcat_orderby") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IsActive">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chksubcatisactive" runat="server" Checked='<%#Eval("subcat_isactive") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvEdit" runat="server" CausesValidation="false" ImageUrl="images/edit.gif"
                                                OnClick="ibgvEdit_Click" />&nbsp;
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvDel" runat="server" CausesValidation="false" ImageUrl="images/del.gif"
                                             OnClientClick="return confirm('Are you sure to delete this SubCategory?')"    OnClick="ibgvDel_Click" />
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
