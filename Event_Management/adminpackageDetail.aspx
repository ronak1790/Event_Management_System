<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminpackageDetail.aspx.cs"
    Inherits="adminpackageDetail" Title="Admin Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Manage Package Detail..!!
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
                <td align="right" valign="top">
                    SubCategory :
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddsubcategory" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddsubcategory_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Packge Name :
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddpackage" runat="server">
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required !"
                        ControlToValidate="ddpackage"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Number of persons :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtperson" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required !"
                        ControlToValidate="txtperson"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Packge Amount:
                </td>
                <td align="left">
                    <asp:TextBox ID="txtpackgeamt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required !"
                        ControlToValidate="txtpackgeamt"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lbltotal" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnDivAdd" runat="server"   OnClick="btnDivAdd_Click"
                        Text="Add " />
                    <asp:Button ID="btnDivCancel" runat="server" CausesValidation="false" OnClick="btnDivCancel_Click"
                        Text="Cancel" />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="height: 69px">
                    <asp:GridView ID="gv" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                        DataKeyNames="PackageAmt_Id" OnPageIndexChanging="gv_PageIndexChanging" PageSize="10"
                        Width="80%">
                        <Columns>
                         <asp:TemplateField HeaderText="Sub Category" Visible="false" >
                                <ItemTemplate>
                                    <asp:Label ID="lblSubCategoryid" runat="server" Text='<%#Eval("SubCat_id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Sub Category" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblPackageId" runat="server" Text='<%#Eval("Package_Id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Category">
                                <ItemTemplate>
                                    <asp:Label ID="lblsubcatname" runat="server" Text='<%#Eval("SubCat_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package_Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblpackagename" runat="server" Text='<%#Eval("Package_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No.Of Person">
                                <ItemTemplate>
                                    <asp:Label ID="lblperson" runat="server" Text='<%#Eval("Person") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Package Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblpackageamt" runat="server" Text='<%#Eval("Package_Amt") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibgvEdit" runat="server" CausesValidation="false"   ImageUrl="images/edit.gif" OnClick="ibgvEdit_Click" />
                                    &nbsp;
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibgvDel" runat="server" CausesValidation="false"  ImageUrl="images/del.gif" OnClick="ibgvDel_Click" />
                                    &nbsp;
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
