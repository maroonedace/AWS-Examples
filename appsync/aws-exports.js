const config = {
    API: {
        GraphQL: {
            endpoint: process.env.REACT_APP_API_URL,
            region: process.env.REACT_APP_AWS_REGION,
            authMode: 'API_KEY',
            apiKey: process.env.REACT_APP_API_KEY,
        },
    },
};

export default config;