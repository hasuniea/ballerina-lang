package ballerina.jms;

import ballerina/log;

public type QueueConsumer object {

    public {
        QueueConsumerConnector connector;
        QueueConsumerEndpointConfiguration config;
    }

    public function init(QueueConsumerEndpointConfiguration config) {
        self.config = config;
        SessionConnector sessionConnector = config.session.getClient();
        self.createConsumer(sessionConnector);
        log:printInfo("Consumer created for queue " + config.queueName);
    }

    public function register (typedesc serviceType) {
        QueueConsumerConnector connector = self.connector;
        self.registerListener(serviceType, connector);
    }

    native function registerListener(typedesc serviceType, QueueConsumerConnector connector);

    native function createConsumer (SessionConnector connector);

    public function start () {
    }

    public function getClient () returns (QueueConsumerConnector) {
        return self.connector;
    }

    public function stop () {
    }
}

public type QueueConsumerEndpointConfiguration {
    Session session;
    string queueName;
    string identifier;
}

public type QueueConsumerConnector object {
}
