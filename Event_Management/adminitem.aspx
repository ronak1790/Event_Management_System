<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminitem.aspx.cs"
    Inherits="adminitem" Title="Admin Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Item..!!
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
                <td align="right" valign="top">
                    Item Name :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtitemname" runat="server" Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvdiv" runat="server" ControlToValidate="txtitemname"
                        Display="Dynamic" ErrorMessage="Enter Item Name" SetFocusOnError="True" ValidationGroup="vgrDiv"
                        EnableViewState="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <%--<tr>
                <td align="right" valign="top">
                    Sub Item Name :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtsitem" runat="server" Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsitem"
                        Display="Dynamic" ErrorMessage="Enter Sub Item Name" SetFocusOnError="True" ValidationGroup="vgrDiv"
                        EnableViewState="False"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
            <tr>
                <td align="right" valign="top">
                    Item Description :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtitemdesc" TextMode="MultiLine" runat="server" Height="105px"
                        Width="314px"></asp:TextBox>&nbsp; &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtitemdesc"
                        Display="Dynamic" ErrorMessage="Enter Item Description" SetFocusOnError="True"
                        ValidationGroup="vgrDiv" EnableViewState="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Order Level :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtorderitem" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Is Active ? :
                </td>
                <td align="left">
                    <asp:CheckBox ID="chkactitem" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lbltotal" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Add " OnClick="btnDivAdd_Click"
                        ValidationGroup="vgrDiv" EnableViewState="False" />
                    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="btnDivCancel_Click"
                        EnableViewState="False" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_Id"
                        Width="80%" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Item Name ">
                                <ItemTemplate>
                                    <asp:Label ID="lblitemname" runat="server" Text='<%#Eval("Item_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Sub Item Name ">
                                <ItemTemplate>
                                    <asp:Label ID="lblsitem" runat="server" Text='<%#Eval("SItem_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Item Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblitemdesc" runat="server" Text='<%#Eval("Item_desc") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Order Level Of Item">
                                <ItemTemplate>
                                    <asp:Label ID="lblorderitem" runat="server" Text='<%#Eval("order_item") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active/Deactive Item ">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkactitem" runat="server" Checked='<%#Eval("Act_Det") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
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
