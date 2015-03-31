<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminpackageassign.aspx.cs"
    Inherits="adminpackageassign" Title="Admin Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Assign Package ..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel align="center" ID="pnlCategory" runat="server">
                <table id="Table5" >
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="left" id="Table5">
                                <tr>
                                    <td align="right" >
                                        Category :
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddcategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        Sub Category :
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddsubcategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddsubcategory_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"  valign="top">
                                        Package :
                                    </td>
                                    <td align="left">
                                        <asp:ListBox ID="lbpackage" Width="100px" Height="100px" runat="server"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table align="center">
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="btnDivAdd" runat="server"  Width="75" 
                                            EnableViewState="False" CssClass="subbtn" OnClick="btnDivAdd_Click" Text="Assign" ValidationGroup="vgrDiv" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnDivCancel"  Width="75" CssClass="subbtn" runat="server"
                                            EnableViewState="False" OnClick="btnDivCancel_Click" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table align="right">
                                <tr>
                                    <td align="right">
                                        Item :
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="dditem" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dditem_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        Sub Item :
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddsubitem" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddsubitem_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"  valign="top">
                                        Sub Item Details :
                                    </td>
                                    <td align="left">
                                        <asp:ListBox ID="lbsubitem2" Width="100px" Height="100px" runat="server"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table align="center">
                                <tr>
                                    <td align="center" colspan="2" style="height: 69px">
                                        <asp:GridView ID="gv" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                            DataKeyNames="Id" OnPageIndexChanging="gv_PageIndexChanging" PageSize="10" Width="100%">
                                            <Columns>
                                                <asp:TemplateField  HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("Cat_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Sub Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsubcatname" runat="server" Text='<%#Eval("SubCat_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Package">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpackagename" runat="server" Text='<%#Eval("Package_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblitemname" runat="server" Text='<%#Eval("Item_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Item Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsitemname" runat="server" Text='<%#Eval("SubItem_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Sub Item Details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsitemname2" runat="server" Text='<%#Eval("SubItem2_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Price">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblprice" runat="server" Text='<%#Eval("SubItem_Price") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ibgvDel" runat="server" ImageUrl="~/images/del.gif" OnClick="ibgvDel_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <table align="center">
                                                    <tr>
                                                        <td style="color: Red">
                                                            No Record Found.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:Content>
