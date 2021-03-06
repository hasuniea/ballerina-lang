// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/kafka;

const POSITIVE_DURATION = 1000;

const TOPIC_1 = "test-1";
const TOPIC_2 = "test-2";

function funcKafkaGetAvailableTopics() returns string[]|error {
    kafka:ConsumerConfig consumerConfigs = {
        bootstrapServers: "localhost:9101",
        groupId: "get-topics-group-1",
        clientId: "available-topic-consumer-1",
        offsetReset: "earliest",
        topics: [TOPIC_1, TOPIC_2]
    };
    kafka:Consumer kafkaConsumer = new(consumerConfigs);
    return kafkaConsumer->getAvailableTopics();
}

function funcKafkaGetAvailableTopicsWithDuration() returns string[]|error {
    kafka:ConsumerConfig consumerConfigs = {
        bootstrapServers: "localhost:9101",
        groupId: "get-topics-group-2",
        clientId: "available-topic-consumer-2",
        offsetReset: "earliest",
        topics: [TOPIC_1, TOPIC_2]
    };
    kafka:Consumer kafkaConsumer = new(consumerConfigs);
    return kafkaConsumer->getAvailableTopics(POSITIVE_DURATION);
}

function funcKafkaGetAvailableTopicsFromNoTimeoutConsumer() returns string[]|error {
    kafka:ConsumerConfig consumerConfigs = {
        bootstrapServers: "localhost:9101",
        groupId: "get-topics-group-3",
        clientId: "available-topic-consumer-3",
        offsetReset: "earliest",
        topics: [TOPIC_1, TOPIC_2],
        defaultApiTimeoutInMillis: -1
    };
    kafka:Consumer kafkaConsumer = new(consumerConfigs);
    return kafkaConsumer->getAvailableTopics();
}

function funcKafkaGetTopicPartitions() returns kafka:TopicPartition[]|error {
    kafka:ConsumerConfig consumerConfigs = {
        bootstrapServers: "localhost:9101",
        groupId: "get-topics-group-4",
        clientId: "available-topic-consumer-4",
        offsetReset: "earliest",
        topics: [TOPIC_1]
    };
    kafka:Consumer kafkaConsumer = new(consumerConfigs);
    return kafkaConsumer->getTopicPartitions(TOPIC_1);
}
