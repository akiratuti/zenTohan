CREATE FUNCTION `zenTohan`(data TEXT character set utf8) RETURNS text CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE kana1_len, kana2_len INT;
    DECLARE kana1_h VARCHAR(72) character set utf8 DEFAULT 'ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｯｬｭｮｧｨｩｪｫ ｰ｡｢｣､･:1234567890';
    DECLARE kana1_z VARCHAR(72) character set utf8 DEFAULT 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンッャュョァィゥェォ　ー。「」、・：１２３４５６７８９０';
    DECLARE kana2_h VARCHAR(52) character set utf8 DEFAULT 'ｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞ';
    DECLARE kana2_z VARCHAR(26) character set utf8 DEFAULT 'ガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴ';

    SET kana1_len = CHAR_LENGTH(kana1_h);
    SET kana2_len = CHAR_LENGTH(kana2_h);

    WHILE kana2_len > 0 DO
            SET data = REPLACE(data, SUBSTRING(kana2_z, kana2_len, 1), SUBSTRING(kana2_h, kana2_len * 2 - 1, 2));
            SET kana2_len = kana2_len - 1;
        END WHILE;

    WHILE kana1_len > 0 DO
            SET data = REPLACE(data, SUBSTRING(kana1_z, kana1_len, 1), SUBSTRING(kana1_h, kana1_len, 1));
            SET kana1_len = kana1_len - 1;
        END WHILE;

    RETURN data;
END

-- Author: Roberto Akira Tsuchiya