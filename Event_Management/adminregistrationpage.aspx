<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminregistrationpage.aspx.cs"
    Inherits="adminregistrationpage" Title="Admin Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Client Details..!!
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
                        <td>
                            <asp:Button ID="Button1" runat="server" Width="200px" CssClass="subbtn" Text="Export to Excel"
                                OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div id="Div1" style="overflow: auto; width: 70; height: 300px;" class="thinBorder">
                <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="False" DataKeyNames="client_id"
                    Width="80%" PageSize="7" AllowPaging="false" OnPageIndexChanging="gv1_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField Visible="false" HeaderText="Item ID">
                            <ItemTemplate>
                                <asp:Label ID="lblitemid" runat="server" Text='<%#Eval("client_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblcname" runat="server" Text='<%#Eval("client_name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Lastname">
                            <ItemTemplate>
                                <asp:Label ID="lbllastname" runat="server" Text='<%#Eval("client_surname") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label ID="lblcity" runat="server" Text='<%#Eval("client_city") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Area">
                            <ItemTemplate>
                                <asp:Label ID="lblarea" runat="server" Text='<%#Eval("client_area") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact No.">
                            <ItemTemplate>
                                <asp:Label ID="lblcontactno" runat="server" Text='<%#Eval("client_contactno") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email id">
                            <ItemTemplate>
                                <asp:Label ID="lblemail" runat="server" Text='<%#Eval("client_email") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Website">
                            <ItemTemplate>
                                <asp:Label ID="lblarea" runat="server" Text='<%#Eval("client_website") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="lblusername" runat="server" Text='<%#Eval("client_username") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="lblpassword" runat="server" Text='<%#Eval("client_password") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="false" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No Record Found.
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
