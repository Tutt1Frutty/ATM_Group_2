CREATE TABLE ATMs (
    atm_id SERIAL PRIMARY KEY,                  -- Unique identifier for each ATM
    location VARCHAR(100) NOT NULL,             -- Location of the ATM
    cash_balance NUMERIC(10, 2) DEFAULT 0.00,  -- Amount of cash available in the ATM
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp for when the ATM was added
);

CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,          -- Unique identifier for each account
    account_holder_name VARCHAR(100) NOT NULL,  -- Name of the account holder
    balance NUMERIC(10, 2) DEFAULT 0.00      -- Balance of the account
);


CREATE TABLE bank_cards (
    card_id SERIAL PRIMARY KEY,            -- Unique identifier for each card
    card_number VARCHAR(16) NOT NULL UNIQUE, -- Unique card number
    pin_code VARCHAR(4) NOT NULL,          -- Card PIN code
    account_id INT REFERENCES accounts(account_id), -- Foreign key referencing accounts
    is_blocked BOOLEAN DEFAULT FALSE,      -- Status of the card (blocked or not)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for when the card was created
);

INSERT INTO ATMs (location, cash_balance) VALUES 
('Main Street, Downtown', 5000.00),
('City Mall', 3000.00),
('University Campus', 1500.00),
('Train Station', 2000.00);

INSERT INTO accounts (account_holder_name, balance) VALUES 
('Alice Johnson', 1500.00),
('Bob Smith', 2500.50),
('Charlie Brown', 500.75);

-- Insert sample bank cards
INSERT INTO bank_cards (card_number, pin_code, account_id) VALUES 
('1234567812345678', '1234', 1),
('8765432187654321', '5678', 2),
('1111222233334444', '0000', 3);