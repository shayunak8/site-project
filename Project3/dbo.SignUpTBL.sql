CREATE TABLE [dbo].[SignUpTBL1] (
    [firstname] NVARCHAR (16) NOT NULL,
    [lastname]  NVARCHAR (16) NULL,
    [password]  NVARCHAR (16) NOT NULL,
    [gender]    BIT           NULL,
    [email]     NVARCHAR (40) NOT NULL,
    [phone]     NVARCHAR (10) NOT NULL,
    [location]  CHAR (1)      NULL,
    [username]  NVARCHAR (16) NOT NULL,
    [admin] BIT NOT NULL, 
    PRIMARY KEY CLUSTERED ([phone] ASC)
);