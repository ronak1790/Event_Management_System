<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminbookingdetails.aspx.cs"
    Inherits="adminbookingdetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">--%>
    <h2 class="about">
        Booking Details..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
                <table id="Table5">
                    <tr>
                        <td colspan="2" align="center" style="height: 17px">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Label runat="server" ID="lbltotal" ForeColor="Red" EnableViewState="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <div id="Div7" style="overflow: auto; width: 510px; height: 300px;" class="thinBorder">
                                <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" Width="30%" PageSize="10"
                                    AllowPaging="false" OnPageIndexChanging="gv1_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="category">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcatname" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="subcategory">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsubcatname" runat="server" Text='<%#Eval("subcat_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="package">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpackagename" runat="server" Text='<%#Eval("package_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Clent name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblclient" runat="server" Text='<%#Eval("client_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="surname">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsn" runat="server" Text='<%#Eval("client_surname") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="client city">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcity" runat="server" Text='<%#Eval("client_city") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="client area">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcarea" runat="server" Text='<%#Eval("client_area") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="contact no">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcontact" runat="server" Text='<%#Eval("client_contactno") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="lblemail" runat="server" Text='<%#Eval("client_email") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Website">
                                            <ItemTemplate>
                                                <asp:Label ID="lblwebsite" runat="server" Text='<%#Eval("client_website") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="username">
                                            <ItemTemplate>
                                                <asp:Label ID="lblun" runat="server" Text='<%#Eval("client_username") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="city event">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcnity" runat="server" Text='<%#Eval("city") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="venue area">
                                            <ItemTemplate>
                                                <asp:Label ID="lblareaname" runat="server" Text='<%#Eval("area") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="venue">
                                            <ItemTemplate>
                                                <asp:Label ID="lblvenue" runat="server" Text='<%#Eval("venue") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="startdate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsdate" runat="server" Text='<%#Eval("sdate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Enddate">
                                            <ItemTemplate>
                                                <asp:Label ID="lbledate" runat="server" Text='<%#Eval("enddate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Guest aspected">
                                            <ItemTemplate>
                                                <asp:Label ID="lblguest" runat="server" Text='<%#Eval("guestaspected") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Time of event">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltoe" runat="server" Text='<%#Eval("timeofevent") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No Record Found.
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Width="200px" CssClass="subbtn" Text="Export to Excel"
                                OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:Content>
