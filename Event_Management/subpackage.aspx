<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true"
    CodeFile="subpackage.aspx.cs" Inherits="subpackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:DataList ID="dl" runat="server" DataKeyField="Package_Id" RepeatColumns="1"
                    RepeatDirection="Vertical">
                    <ItemTemplate>
                        <h2 class="about">
                            <%# Eval("SubCat_Name")%>:
                            <%# Eval("Package_Name") %>
                            Package
                        </h2>
                        <p align="justify" style="color: White" align="justify" class="righttxt">
                            <br />
                            <%# Eval("Package_Desc") %>
                            <br />
                            <br />
                            <br />
                        </p>
                        </td> </tr>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <h2 class="about">
                    Package Rate Structure</h2>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gv" runat="server" AllowPaging="true" AutoGenerateColumns="False" BorderColor="Black"
                     DataKeyNames="Id" Width="80%" HeaderStyle-Font-Size="Small">
                  <%--  HeaderStyle-ForeColor="Gold">--%>
                    <Columns>
                        <asp:TemplateField HeaderText="Number Of Person">
                            <ItemTemplate>
                                <asp:Label ID="lblperson" runat="server" Text='<%#Eval("Person") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Package Amount ">
                            <ItemTemplate>
                                <asp:Label ID="lblpackagamt" runat="server" Text='<%#Eval("Package_Amt") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No Record Found.
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <h2 class="about">
                    Package Item Details</h2>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gv2" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                    BorderColor="Black" DataKeyNames="Id" Width="80%" HeaderStyle-Font-Size="Small">
                    <Columns>
                        <asp:TemplateField HeaderText="Item">
                            <ItemTemplate>
                                <asp:Label ID="lblsubitem" runat="server" Text='<%#Eval("SubItem_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item Details">
                            <ItemTemplate>
                                <asp:Label ID="lblsubitem2" runat="server" Text='<%#Eval("SubItem2_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No Record Found.
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <h2 class="about">
                    <a href="bookevent.aspx">Register Event </a></h2>
            </td>
        </tr>
    </table>
</asp:Content>
