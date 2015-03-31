<%@ Page  Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true"
    CodeFile="adminsubitem2.aspx.cs" Inherits="adminsubitem2"  Title="Sub Item Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Sub Item Detail..!!
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
                            Item Name :
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="dropitem" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropitem_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Sub Item Name :
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddsitem" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            Sub Item Name Detail:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtsubitemname" runat="server" Width="213px"></asp:TextBox>&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsubitemname"
                                Display="Dynamic" ErrorMessage="Enter SubItem Name" SetFocusOnError="True" ValidationGroup="vgrDiv"
                                EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                             Description :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtsubitemdesc" TextMode="MultiLine" runat="server" Height="105px"
                                Width="374px"></asp:TextBox>&nbsp; &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsubitemdesc"
                                Display="Dynamic" ErrorMessage="Enter SubItem Description" SetFocusOnError="True"
                                ValidationGroup="vgrDiv" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            Price :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtsubitemprice" runat="server" Width="213px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lbltotal" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnaddedit" runat="server" Text="Add " OnClick="btnDivAdd_Click"
                                ValidationGroup="vgrDiv" EnableViewState="False" />
                            <asp:Button ID="btndel" runat="server" Text="Cancel" OnClick="btnDivCancel_Click"
                                EnableViewState="False" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="Subitem2_Id"
                                Width="80%" AllowPaging="true" PageSize="7" OnPageIndexChanging="gv_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="Item Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsubitemid2" runat="server" Text='<%#Eval("subItem2_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Item Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblitemid" runat="server" Text='<%#Eval("Item_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Item Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsubitemid" runat="server" Text='<%#Eval("SubItem_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblitemname" runat="server" Text='<%#Eval("Item_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Item Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsitemname" runat="server" Text='<%#Eval("SubItem_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Item Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsubitemname" runat="server" Text='<%#Eval("SubItem2_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Item Price">
                                        <ItemTemplate>
                                            <asp:Label ID="lblitemprice" runat="server" Text='<%#Eval("SubItem_price") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sub Item desc" Visible="false"  >
                                        <ItemTemplate>
                                            <asp:Label ID="lblitemdesc" runat="server" Text='<%#Eval("subItem2_desc") %>'></asp:Label>
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
