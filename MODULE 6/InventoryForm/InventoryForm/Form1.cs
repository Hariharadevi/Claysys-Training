using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Text;
using System.Windows.Forms;

namespace InventoryForm
{
    public partial class Form1 : Form
    {
        string connectionString = "Data Source=DESKTOP-KBK7UE0\\SQLEXPRESS;Initial Catalog=InventoryDB;Integrated Security=True";

        public Form1()
        {
            InitializeComponent();
            LoadProducts();
        }
        private void LoadProducts()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Products", conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dataGridView1.DataSource = dt;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Products(ProductName,Quantity,PriceperUnit,Supplier) VALUES (@name,@quantity,@price,@supplier)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name",txtProductName.Text);
                cmd.Parameters.AddWithValue("@Quantity", int.Parse(txtQuantity.Text));
                cmd.Parameters.AddWithValue("@price",decimal.Parse(txtPricePerUnit.Text));
                cmd.Parameters.AddWithValue("@Supplier",txtSupplier.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Product Added Successfully");
                LoadProducts();

            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn=new SqlConnection(connectionString))
            {
                string query = "UPDATE Products SET Quantity = @quantity,PricePerUnit = @Price WHERE ProductID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", int.Parse(txtProductId.Text));
                cmd.Parameters.AddWithValue("@quantity", int.Parse(txtQuantity.Text));
                cmd.Parameters.AddWithValue("@price", decimal.Parse(txtPricePerUnit.Text));
                conn.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Product Updated Successfully");
                LoadProducts();

            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn=new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Products WHERE ProductID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", int.Parse(txtProductId.Text));
                conn.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Product Deleted Successfuly");
                LoadProducts();

            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM ProductName LIKE '%' + @name + '%' OR ProductID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", txtProductName.Text);
                cmd.Parameters.AddWithValue("@id", txtProductId.Text != " " ? (object)int.Parse(txtProductId.Text) : DBNull.Value);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dataGridView1.DataSource = dt;
            }
        }

        private void txtProductId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
