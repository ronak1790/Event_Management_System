<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Management System</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="pnlCategory" runat="server">
        <table id="Table5" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid">
            <tr>
                <td class="dgHeader" colspan="2">
                    Manage Category
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
                    <asp:TextBox ID="txtCagegory" runat="server"></asp:TextBox>&nbsp; &nbsp;<asp:Button
                        ID="btnDivAdd" runat="server" Text="Add / Edit" OnClick="btnDivAdd_Click" ValidationGroup="vgrDiv"
                        EnableViewState="False" />
                    <asp:Button ID="btnDivCancel" runat="server" Text="Cancel" OnClick="btnDivCancel_Click"
                        EnableViewState="False" />&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvdiv" runat="server" ControlToValidate="txtCagegory"
                        Display="Dynamic" ErrorMessage="Enter Category" SetFocusOnError="True" ValidationGroup="vgrDiv"
                        EnableViewState="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <div id="Div7" style="overflow-x: auto; overflow-y: auto; width: 100%; height: 340px;"
                        class="thinBorder">
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                            Width="80%">
                            <Columns>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("CatName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibgvEdit" runat="server" ImageUrl="edit.gif" OnClick="ibgvEdit_Click" />&nbsp;
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibgvDel" runat="server" ImageUrl="del.gif" OnClick="ibgvDel_Click" />&nbsp;
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
