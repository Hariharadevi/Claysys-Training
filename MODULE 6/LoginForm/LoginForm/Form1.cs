namespace LoginForm
{
    public partial class LoginFormApp : Form
    {
        private const string ValidUsername = "admin";
        private const string ValidPassword = "password123";
        public LoginFormApp()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password)) 
            {
                MessageBox.Show("please fill in both fields.", "validation error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if(username==ValidUsername&&password==ValidPassword)
            {
                MessageBox.Show("Login successful!", "success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtUsername.Text = string.Empty;
                txtPassword.Text = string.Empty;
                chkRememberMe.Checked= false;
            }
            else
            {
                MessageBox.Show("Invalid credentials. Please try again", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
