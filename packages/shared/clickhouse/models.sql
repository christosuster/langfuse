INSERT INTO "langfuse"."models" (
    "id",
    "created_at",
    "updated_at",
    "project_id",
    "model_name",
    "match_pattern",
    "start_date",
    "input_price",
    "output_price",
    "total_price",
    "unit",
    "tokenizer_config",
    "tokenizer_id"
  )
VALUES (
    'b9854a5c92dc496b997d99d20',
    '2024-05-28 12:34:59.363',
    '2024-05-28 12:34:59.363',
    NULL,
    'gpt-4o',
    '(?i)^(gpt-4o)$',
    NULL,
    0.000005000000000000000000000000,
    0.000015000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4o", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'b9854a5c92dc496b997d99d21',
    '2024-05-28 12:34:59.363',
    '2024-05-28 12:34:59.363',
    NULL,
    'gpt-4o-2024-05-13',
    '(?i)^(gpt-4o-2024-05-13)$',
    NULL,
    0.000005000000000000000000000000,
    0.000015000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4o-2024-05-13", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkvq6iq000008ju6c16gynt',
    '2024-05-28 12:34:59.293',
    '2024-05-28 12:34:59.293',
    NULL,
    'gpt-4-1106-preview',
    '(?i)^(gpt-4-1106-preview)$',
    NULL,
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-1106-preview", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkvx5gp000108juaogs54ea',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4-turbo-vision',
    '(?i)^(gpt-4-vision-preview)$',
    NULL,
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-vision-preview", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkvyzgw000308jue4hse4j9',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4-32k',
    '(?i)^(gpt-4-32k)$',
    NULL,
    0.000060000000000000000000000000,
    0.000120000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-32k", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cb000108l5hwwh3zdi',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4-32k-0613',
    '(?i)^(gpt-4-32k-0613)$',
    NULL,
    0.000060000000000000000000000000,
    0.000120000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-32k-0613", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cb000208l59yvb9yq8',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo-1106',
    '(?i)^(gpt-)(35|3.5)(-turbo-1106)$',
    NULL,
    0.000001000000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-1106", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cb000308l5go4b6otm',
    '2024-05-28 12:34:58.998',
    '2024-05-28 12:34:58.998',
    NULL,
    'gpt-3.5-turbo-16k',
    '(?i)^(gpt-)(35|3.5)(-turbo-16k)$',
    NULL,
    0.000003000000000000000000000000,
    0.000004000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-16k", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cb000408l576jl7koo',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo',
    '(?i)^(gpt-)(35|3.5)(-turbo)$',
    '2023-11-06 00:00:00',
    0.000001000000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cc000808l51xmk4uic',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo-0613',
    '(?i)^(gpt-)(35|3.5)(-turbo-0613)$',
    NULL,
    0.000001500000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-0613", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cc000908l537kl0rx3',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4-0613',
    '(?i)^(gpt-4-0613)$',
    NULL,
    0.000030000000000000000000000000,
    0.000060000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-0613", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrkwk4cc000a08l562uc3s9g',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo-instruct',
    '(?i)^(gpt-)(35|3.5)(-turbo-instruct)$',
    NULL,
    0.000001500000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrntjt89000108jwcou1af71',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-ada-001',
    '(?i)^(text-ada-001)$',
    NULL,
    NULL,
    NULL,
    0.000004000000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-ada-001"}',
    'openai'
  ),
  (
    'clrntjt89000208jwawjr894q',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-babbage-001',
    '(?i)^(text-babbage-001)$',
    NULL,
    NULL,
    NULL,
    0.000000500000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-babbage-001"}',
    'openai'
  ),
  (
    'clrntjt89000308jw0jtfa4rs',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-curie-001',
    '(?i)^(text-curie-001)$',
    NULL,
    NULL,
    NULL,
    0.000020000000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-curie-001"}',
    'openai'
  ),
  (
    'clrntjt89000408jwc2c93h6i',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-davinci-001',
    '(?i)^(text-davinci-001)$',
    NULL,
    NULL,
    NULL,
    0.000020000000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-davinci-001"}',
    'openai'
  ),
  (
    'clrntjt89000508jw192m64qi',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-davinci-002',
    '(?i)^(text-davinci-002)$',
    NULL,
    NULL,
    NULL,
    0.000020000000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-davinci-002"}',
    'openai'
  ),
  (
    'clrntjt89000608jw4m3x5s55',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-davinci-003',
    '(?i)^(text-davinci-003)$',
    NULL,
    NULL,
    NULL,
    0.000020000000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-davinci-003"}',
    'openai'
  ),
  (
    'clrntjt89000908jwhvkz5crg',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-embedding-ada-002-v2',
    '(?i)^(text-embedding-ada-002-v2)$',
    '2022-12-06 00:00:00',
    NULL,
    NULL,
    0.000000100000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-embedding-ada-002"}',
    'openai'
  ),
  (
    'clrntjt89000908jwhvkz5crm',
    '2024-05-28 12:34:58.973',
    '2024-05-28 12:34:58.973',
    NULL,
    'text-embedding-ada-002',
    '(?i)^(text-embedding-ada-002)$',
    '2022-12-06 00:00:00',
    NULL,
    NULL,
    0.000000100000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-embedding-ada-002"}',
    'openai'
  ),
  (
    'clrntjt89000a08jw0gcdbd5a',
    '2024-05-28 12:34:58.998',
    '2024-05-28 12:34:58.998',
    NULL,
    'gpt-3.5-turbo-16k-0613',
    '(?i)^(gpt-)(35|3.5)(-turbo-16k-0613)$',
    NULL,
    0.000003000000000000000000000000,
    0.000004000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-16k-0613", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrntkjgy000a08jx4e062mr0',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo-0301',
    '(?i)^(gpt-)(35|3.5)(-turbo-0301)$',
    NULL,
    0.000002000000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": -1, "tokenizerModel": "gpt-3.5-turbo-0301", "tokensPerMessage": 4}',
    'openai'
  ),
  (
    'clrntkjgy000b08jx769q1bah',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo',
    '(?i)^(gpt-)(35|3.5)(-turbo)$',
    NULL,
    0.000002000000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": -1, "tokenizerModel": "gpt-3.5-turbo", "tokensPerMessage": 4}',
    'openai'
  ),
  (
    'clrntkjgy000c08jxesb30p3f',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-3.5-turbo',
    '(?i)^(gpt-)(35|3.5)(-turbo)$',
    '2023-06-27 00:00:00',
    0.000001500000000000000000000000,
    0.000002000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrntkjgy000d08jx0p4y9h4l',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4-32k-0314',
    '(?i)^(gpt-4-32k-0314)$',
    NULL,
    0.000060000000000000000000000000,
    0.000120000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-32k-0314", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrntkjgy000e08jx4x6uawoo',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4-0314',
    '(?i)^(gpt-4-0314)$',
    NULL,
    0.000030000000000000000000000000,
    0.000060000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-0314", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrntkjgy000f08jx79v9g1xj',
    '2024-05-28 12:34:58.963',
    '2024-05-28 12:34:58.963',
    NULL,
    'gpt-4',
    '(?i)^(gpt-4)$',
    NULL,
    0.000030000000000000000000000000,
    0.000060000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clrnwb41q000308jsfrac9uh6',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-instant-1.2',
    '(?i)^(claude-instant-1.2)$',
    NULL,
    0.000001630000000000000000000000,
    0.000005510000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrnwb836000408jsallr6u11',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-2.0',
    '(?i)^(claude-2.0)$',
    NULL,
    0.000008000000000000000000000000,
    0.000024000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrnwbd1m000508js4hxu6o7n',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-2.1',
    '(?i)^(claude-2.1)$',
    NULL,
    0.000008000000000000000000000000,
    0.000024000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrnwbg2b000608jse2pp4q2d',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-1.3',
    '(?i)^(claude-1.3)$',
    NULL,
    0.000008000000000000000000000000,
    0.000024000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrnwbi9d000708jseiy44k26',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-1.2',
    '(?i)^(claude-1.2)$',
    NULL,
    0.000008000000000000000000000000,
    0.000024000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrnwblo0000808jsc1385hdp',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-1.1',
    '(?i)^(claude-1.1)$',
    NULL,
    0.000008000000000000000000000000,
    0.000024000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrnwbota000908jsgg9mb1ml',
    '2024-05-28 12:34:58.988',
    '2024-05-28 12:34:58.988',
    NULL,
    'claude-instant-1',
    '(?i)^(claude-instant-1)$',
    NULL,
    0.000001630000000000000000000000,
    0.000005510000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'clrs2dnql000108l46vo0gp2t',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'babbage-002',
    '(?i)^(babbage-002)$',
    NULL,
    0.000000400000000000000000000000,
    0.000001600000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokenizerModel": "babbage-002"}',
    'openai'
  ),
  (
    'clrs2ds35000208l4g4b0hi3u',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'davinci-002',
    '(?i)^(davinci-002)$',
    NULL,
    0.000006000000000000000000000000,
    0.000012000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokenizerModel": "davinci-002"}',
    'openai'
  ),
  (
    'clruwn3pc00010al7bl611c8o',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'text-embedding-3-small',
    '(?i)^(text-embedding-3-small)$',
    NULL,
    NULL,
    NULL,
    0.000000020000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-embedding-ada-002"}',
    'openai'
  ),
  (
    'clruwn76700020al7gp8e4g4l',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'text-embedding-ada-002-v2',
    '(?i)^(text-embedding-3-large)$',
    NULL,
    NULL,
    NULL,
    0.000000130000000000000000000000,
    'TOKENS',
    '{"tokenizerModel": "text-embedding-ada-002"}',
    'openai'
  ),
  (
    'clruwnahl00030al7ab9rark7',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'gpt-3.5-turbo-0125',
    '(?i)^(gpt-)(35|3.5)(-turbo-0125)$',
    NULL,
    0.000000500000000000000000000000,
    0.000001500000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clruwnahl00040al78f1lb0at',
    '2024-05-28 12:34:59.011',
    '2024-05-28 12:34:59.011',
    NULL,
    'gpt-3.5-turbo',
    '(?i)^(gpt-)(35|3.5)(-turbo)$',
    '2024-02-16 00:00:00',
    0.000000500000000000000000000000,
    0.000001500000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clruwnahl00050al796ck3p44',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'gpt-4-0125-preview',
    '(?i)^(gpt-4-0125-preview)$',
    NULL,
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clruwnahl00060al74fcfehas',
    '2024-05-28 12:34:58.977',
    '2024-05-28 12:34:58.977',
    NULL,
    'gpt-4-turbo-preview',
    '(?i)^(gpt-4-turbo-preview)$',
    NULL,
    0.000030000000000000000000000000,
    0.000060000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'cls08r8sq000308jq14ae96f0',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'ft:gpt-3.5-turbo-1106',
    '(?i)^(ft:)(gpt-3.5-turbo-1106:)(.+)(:)(.*)(:)(.+)$',
    NULL,
    0.000003000000000000000000000000,
    0.000006000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-1106", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'cls08rp99000408jqepxoakjv',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'ft:gpt-3.5-turbo-0613',
    '(?i)^(ft:)(gpt-3.5-turbo-0613:)(.+)(:)(.*)(:)(.+)$',
    NULL,
    0.000012000000000000000000000000,
    0.000016000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-0613", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'cls08rv9g000508jq5p4z4nlr',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'ft:davinci-002',
    '(?i)^(ft:)(davinci-002:)(.+)(:)(.*)(:)(.+)$$',
    NULL,
    0.000012000000000000000000000000,
    0.000012000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokenizerModel": "davinci-002"}',
    'openai'
  ),
  (
    'cls08s2bw000608jq57wj4un2',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'ft:babbage-002',
    '(?i)^(ft:)(babbage-002:)(.+)(:)(.*)(:)(.+)$$',
    NULL,
    0.000001600000000000000000000000,
    0.000001600000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokenizerModel": "babbage-002"}',
    'openai'
  ),
  (
    'cls0iv12d000108l251gf3038',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'chat-bison',
    '(?i)^(chat-bison)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0j33v1000008joagkc4lql',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'codechat-bison-32k',
    '(?i)^(codechat-bison-32k)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0jmc9v000008l8ee6r3gsd',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'codechat-bison',
    '(?i)^(codechat-bison)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0jmjt3000108l83ix86w0d',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'text-bison-32k',
    '(?i)^(text-bison-32k)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0jni4t000008jk3kyy803r',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'chat-bison-32k',
    '(?i)^(chat-bison-32k)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0jungb000208jk12gm4gk1',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'text-unicorn',
    '(?i)^(text-unicorn)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000002500000000000000000000000,
    0.000007500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0juygp000308jk2a6x9my2',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'text-bison',
    '(?i)^(text-bison)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls0k4lqt000008ky1o1s8wd5',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'gemini-pro',
    '(?i)^(gemini-pro)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls1nyj5q000208l33ne901d8',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'textembedding-gecko',
    '(?i)^(textembedding-gecko)(@[a-zA-Z0-9]+)?$',
    NULL,
    NULL,
    NULL,
    0.000000100000000000000000000000,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls1nyyjp000308l31gxy1bih',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'textembedding-gecko-multilingual',
    '(?i)^(textembedding-gecko-multilingual)(@[a-zA-Z0-9]+)?$',
    NULL,
    NULL,
    NULL,
    0.000000100000000000000000000000,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls1nzjt3000508l3dnwad3g0',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'code-gecko',
    '(?i)^(code-gecko)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls1nzwx4000608l38va7e4tv',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'code-bison',
    '(?i)^(code-bison)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cls1o053j000708l39f8g4bgs',
    '2024-05-28 12:34:58.995',
    '2024-05-28 12:34:58.995',
    NULL,
    'code-bison-32k',
    '(?i)^(code-bison-32k)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'clsk9lntu000008jwfc51bbqv',
    '2024-05-28 12:34:59.011',
    '2024-05-28 12:34:59.011',
    NULL,
    'gpt-3.5-turbo-16k',
    '(?i)^(gpt-)(35|3.5)(-turbo-16k)$',
    '2024-02-16 00:00:00',
    0.000000500000000000000000000000,
    0.000001500000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-3.5-turbo-16k", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clsnq07bn000008l4e46v1ll8',
    '2024-05-28 12:34:59.019',
    '2024-05-28 12:34:59.019',
    NULL,
    'gpt-4-turbo-preview',
    '(?i)^(gpt-4-turbo-preview)$',
    '2023-11-06 00:00:00',
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'cltgy0iuw000008le3vod1hhy',
    '2024-05-28 12:34:59.113',
    '2024-05-28 12:34:59.113',
    NULL,
    'claude-3-opus-20240229',
    '(?i)^(claude-3-opus-20240229)$',
    NULL,
    0.000015000000000000000000000000,
    0.000075000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'cltgy0pp6000108le56se7bl3',
    '2024-05-28 12:34:59.113',
    '2024-05-28 12:34:59.113',
    NULL,
    'claude-3-sonnet-20240229',
    '(?i)^(claude-3-sonnet-20240229)$',
    NULL,
    0.000003000000000000000000000000,
    0.000015000000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'cltr0w45b000008k1407o9qv1',
    '2024-05-28 12:34:59.126',
    '2024-05-28 12:34:59.126',
    NULL,
    'claude-3-haiku-20240307',
    '(?i)^(claude-3-haiku-20240307)$',
    NULL,
    0.000000250000000000000000000000,
    0.000001250000000000000000000000,
    NULL,
    'TOKENS',
    NULL,
    'claude'
  ),
  (
    'cluv2sjeo000008ih0fv23hi0',
    '2024-05-28 12:34:59.196',
    '2024-05-28 12:34:59.196',
    NULL,
    'gemini-1.0-pro-latest',
    '(?i)^(gemini-1.0-pro-latest)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000000250000000000000000000000,
    0.000000500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cluv2subq000108ih2mlrga6a',
    '2024-05-28 12:34:59.196',
    '2024-05-28 12:34:59.196',
    NULL,
    'gemini-1.0-pro',
    '(?i)^(gemini-1.0-pro)(@[a-zA-Z0-9]+)?$',
    '2024-02-15 00:00:00',
    0.000000125000000000000000000000,
    0.000000375000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cluv2sx04000208ihbek75lsz',
    '2024-05-28 12:34:59.196',
    '2024-05-28 12:34:59.196',
    NULL,
    'gemini-1.0-pro-001',
    '(?i)^(gemini-1.0-pro-001)(@[a-zA-Z0-9]+)?$',
    '2024-02-15 00:00:00',
    0.000000125000000000000000000000,
    0.000000375000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cluv2szw0000308ihch3n79x7',
    '2024-05-28 12:34:59.196',
    '2024-05-28 12:34:59.196',
    NULL,
    'gemini-pro',
    '(?i)^(gemini-pro)(@[a-zA-Z0-9]+)?$',
    '2024-02-15 00:00:00',
    0.000000125000000000000000000000,
    0.000000375000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cluv2t2x0000408ihfytl45l1',
    '2024-05-28 12:34:59.196',
    '2024-05-28 12:34:59.196',
    NULL,
    'gemini-1.5-pro-latest',
    '(?i)^(gemini-1.5-pro-latest)(@[a-zA-Z0-9]+)?$',
    NULL,
    0.000002500000000000000000000000,
    0.000007500000000000000000000000,
    NULL,
    'CHARACTERS',
    NULL,
    NULL
  ),
  (
    'cluv2t5k3000508ih5kve9zag',
    '2024-05-28 12:34:59.293',
    '2024-05-28 12:34:59.293',
    NULL,
    'gpt-4-turbo-2024-04-09',
    '(?i)^(gpt-4-turbo-2024-04-09)$',
    NULL,
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-turbo-2024-04-09", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'cluvpl4ls000008l6h2gx3i07',
    '2024-05-28 12:34:59.203',
    '2024-05-28 12:34:59.203',
    NULL,
    'gpt-4-turbo',
    '(?i)^(gpt-4-turbo)$',
    NULL,
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-1106-preview", "tokensPerMessage": 3}',
    'openai'
  ),
  (
    'clv2o2x0p000008jsf9afceau',
    '2024-05-28 12:34:59.293',
    '2024-05-28 12:34:59.293',
    NULL,
    ' gpt-4-preview',
    '(?i)^(gpt-4-preview)$',
    NULL,
    0.000010000000000000000000000000,
    0.000030000000000000000000000000,
    NULL,
    'TOKENS',
    '{"tokensPerName": 1, "tokenizerModel": "gpt-4-turbo-preview", "tokensPerMessage": 3}',
    'openai'
  );