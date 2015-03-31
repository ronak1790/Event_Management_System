<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminpackage.aspx.cs"
    Inherits="adminpackage" Title="Admin Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Package..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel align="center" ID="pnlCategory" runat="server">
        <table id="Table5" >
            
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Sub Category Name:
                </td>
                <td align="left">
                    <asp:DropDownList ID="dropdwcategory" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Package Name :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtpackagename" runat="server" Width="205px"></asp:TextBox>&nbsp;
                    &nbsp;
                    <asp:RequiredFieldValidator ID="rfvdiv" runat="server" ControlToValidate="txtpackagename"
                        Display="Dynamic" ErrorMessage="Enter Package Name" SetFocusOnError="True" ValidationGroup="vgrDiv"
                        EnableViewState="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Package Description :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtpackagedesc" TextMode="MultiLine" runat="server" Height="133px"
                        Width="377px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvcat" runat="server" ControlToValidate="txtpackagedesc"
                        Display="Dynamic" ErrorMessage="Enter Package Description" SetFocusOnError="True"
                        ValidationGroup="vgrDiv" EnableViewState="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Is Active ? :
                </td>
                <td align="left">
                    <asp:CheckBox ID="chkactpackage" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Add " OnClick="btnDivAdd_Click" ValidationGroup="vgrDiv"
                        EnableViewState="False" />
                    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="btnDivCancel_Click"
                        EnableViewState="False" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:GridView ID="gv" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                        DataKeyNames="Package_Id" OnPageIndexChanging="gv_PageIndexChanging" PageSize="7"
                        Width="80%">
                        <Columns>
                            <asp:TemplateField HeaderText="SubCategory Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblCategoryId" runat="server" Text='<%#Eval("SubCat_Id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SubCategory Name ">
                                <ItemTemplate>
                                    <asp:Label ID="lblcategoryname" runat="server" Text='<%#Eval("SubCat_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package Name ">
                                <ItemTemplate>
                                    <asp:Label ID="lblpackagename" runat="server" Text='<%#Eval("Package_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package Description" Visible="false" >
                                <ItemTemplate>
                                    <asp:Label ID="lblpackagedesc" runat="server" Text='<%#Eval("Package_Desc") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active/Deactive Package">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkpackage" runat="server" Checked='<%#Eval("Active_Package") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibgvEdit" runat="server" ImageUrl="images/edit.gif" OnClick="ibgvEdit_Click" />&nbsp;
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibgvDel" runat="server" ImageUrl="images/del.gif" OnClick="ibgvDel_Click" />&nbsp;
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            No Record Found.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:Panel>
        </div>
</asp:Content>
