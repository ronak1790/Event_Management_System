<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true"
    CodeFile="adminsubitem.aspx.cs" Inherits="adminsubitem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Sub Item..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel align="center" ID="pnlCategory" runat="server">
                <table id="Table5">
                    
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
                            <asp:DropDownList ID="dropitem" runat="server" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <tr>
                            <td align="right">
                                Sub Item Name :
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtsitem" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" valign="top">
                                Sub Item Description :
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
                                Order Level :
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtordersubitem" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                Is Active ? :
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkactsubitem" runat="server" />
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
                                <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="SubItem_Id"
                                    Width="80%" AllowPaging="true" PageSize="7" OnPageIndexChanging="gv_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblitemid" runat="server" Text='<%#Eval("Item_Id") %>'></asp:Label>
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
                                                <asp:Label ID="lblsubitemname" runat="server" Text='<%#Eval("SubItem_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Item Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsubitemdesc" runat="server" Text='<%#Eval("SubItem_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Order Level">
                                            <ItemTemplate>
                                                <asp:Label ID="lblitemorder" runat="server" Text='<%#Eval("Order_SubItem") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Active / Deactive">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chksubitem" runat="server" Checked='<%#Eval("Act_SubItem") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
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
