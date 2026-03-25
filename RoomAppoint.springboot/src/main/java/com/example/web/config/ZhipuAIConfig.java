// ZhipuAIConfig.java
package com.example.web.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "zhipu.api")
public class ZhipuAIConfig {
    private String key;
    private String baseUrl;
    private String model;
    private Integer maxTokens;
    private Double temperature;
    private Long timeout;
}